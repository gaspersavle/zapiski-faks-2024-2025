from colorama import Fore
from collections import Counter
import numpy as np
from decimal import Decimal, getcontext
import matplotlib.pyplot as plt
import random
import json
import os

class TextAnaliser():
    def __init__(self, file_name:str):
        self.FILE_PATH = f"./cankar/{file_name}.txt"
        self.FILE_NAME = file_name
        self.MOST_PROBABLE = None
        self.LEAST_PROBABLE = None
        self.CLOSEST_TO_AVG = None
        self.ZIPF_CORRELATION = None
        self.PROBS_SINGLE = None
        self.PROBS_BIGRAM = None
        self.PROBS_TRIGRAM = None
        self.PROBS_QUADGRAM = None
        self.ENTROPY_EQUAL = None
        self.ENTROPY_ACTUAL = None
        self.ENTROPY_BIGRAM = None
        self.OUTPUT_DIR = file_name
        self.OUTPUT_FILE_SINGLE = f"generated_{file_name}_single"
        self.OUTPUT_FILE_DET = f"generated_{file_name}_q_deterministic"
        self.OUTPUT_FILE_RAND = f"generated_{file_name}_q_weighted_random"
        self.OUTPUT_FILE_TEMP = f"generated_{file_name}_q_temperature"
        os.mkdir(path=f"./{self.OUTPUT_DIR}")

    def split_text(self)->list:
        textfile = open(self.FILE_PATH)
        text = textfile.read()
        spacesplit = text.split()
        spacesplit

        punctuation = ["...", ".",",","!","?", "—", ";", ":", "—<<", "‛"]
        finalsplit = []
        for word in spacesplit:
            match = [mark for mark in punctuation if (mark in word) and word not in punctuation]
            if match:
                #print(f"{Fore.RED}{match[0]} in: {Fore.RESET}{word}")
                new = [word[:-1], word[-1]]
                #print(f"{Fore.GREEN}{new}")
                for element in new:
                    if element != "":
                        finalsplit.append(element)
            else:
                finalsplit.append(word)
        return finalsplit

    def get_probs(self,text_split:list)->dict:
        count = Counter(text_split)
        all_words = count.total()
        word_probabilities = {word: count / all_words for word, count in count.items()}
        self.PROBS_SINGLE=word_probabilities
        keylist = list(word_probabilities.keys())
        vallist = list(word_probabilities.values())

        topitems = count.most_common(5)
        self.MOST_PROBABLE=topitems
        print(f"{Fore.GREEN}Most probable:\n------------------------------------------")
        for word, num in topitems:
            probability = num/all_words
            print(f"{Fore.BLUE}Word: {Fore.RESET}{word} ({num}) | {Fore.GREEN}Prob: {Fore.RESET}{probability}")
        botitems = count.most_common()[:-6:-1]
        self.LEAST_PROBABLE=botitems
        print(f"{Fore.RED}\nLeast probable:\n------------------------------------------")
        for word, num in botitems:
            probability = num/all_words
            print(f"{Fore.BLUE}Word: {Fore.RESET}{word} ({num}) | {Fore.RED}Prob: {Fore.RESET}{probability}")

        probs = np.array(vallist)
        geometric_mid = np.sqrt(probs.max()**2 - probs.min()**2)
        geometric_mid

        smaller = [prob for prob in probs if prob < geometric_mid]

        if smaller:
            closest_smaller = max(smaller, key=lambda x: x - geometric_mid)
            word = keylist[vallist.index(closest_smaller)]
            print(f"\n{Fore.LIGHTMAGENTA_EX}Closest in probability to the geometric avg:\n------------------------------------------")
            print(f"{Fore.BLUE}Word: {Fore.RESET}{word} ({count[word]}) | {Fore.RED}Prob: {Fore.RESET}{closest_smaller}")
            self.CLOSEST_TO_AVG = {"word":word,"prob":closest_smaller}
        else:
            print(f"No number greater than {geometric_mid} found.")
            self.CLOSEST_TO_AVG = {"word":None,"prob":None}

        return word_probabilities

    def get_zipf(self, text_split:list)->None:
        count = Counter(text_split)
        sortedcount = count.most_common()
        _, countlist = zip(*sortedcount)
        countlist

        ranks = range(1, len(countlist) + 1)  # Ranks: 1, 2, 3, ...

        C = countlist[0]  
        zipf_predicted = [C / rank for rank in ranks]

        plt.plot(ranks, countlist, label='Actual Frequencies')

        plt.plot(ranks, zipf_predicted, linestyle='--', label='Zipf Predicted')

        plt.xscale('log')
        plt.yscale('log')

        plt.xlabel('Rank (log scale)')
        plt.ylabel('Frequency (log scale)')
        plt.title('Actual vs. Zipf-Predicted Word Frequencies')
        plt.legend()

        # plt.show()
        plt.savefig(fname=f"{self.OUTPUT_DIR}/zipf_{self.FILE_NAME}.png")
        plt.close()
        plt.clf()
        correlation = np.corrcoef(countlist, zipf_predicted)[0,1]
        self.ZIPF_CORRELATION = correlation

    def get_cond_probs(self,text_split:list)->list:
        bigrams = [(text_split[i], text_split[i+1]) for i in range(len(text_split)-1)]
        trigrams = [(text_split[i], text_split[i+1], text_split[i+2]) for i in range(len(text_split)-2)]
        quadgrams = [(text_split[i], text_split[i+1], text_split[i+2], text_split[i+3]) for i in range(len(text_split)-3)]

        bigram_counts = Counter(bigrams)
        trigram_counts = Counter(trigrams)
        quadgram_counts = Counter(quadgrams)
        split_count = Counter(text_split)
        total_bigrams = bigram_counts.total()
        total_trigrams = trigram_counts.total()
        total_quadgrams = quadgram_counts.total()
        total_split = split_count.total()

        bigram_probs = {bigram: count / total_bigrams for bigram, count in bigram_counts.items()}
        trigram_probs = {trigram: count / total_trigrams for trigram, count in trigram_counts.items()}
        quadgram_probs = {quadgram: count / total_quadgrams for quadgram, count in quadgram_counts.items()}
        split_probs = {word: count / total_split for word, count in split_count.items()}

        condprobs_bi = {}
        condprobs_tri = {}
        condprobs_quad = {}
        for (word1, word2), prob in bigram_probs.items():
            condprobs_bi[(word1, word2)] = prob/split_probs[word1]

        for (word1, word2, word3), prob in trigram_probs.items():
            condprobs_tri[(word1,word2, word3)] = prob/(split_probs[word1]*condprobs_bi[(word1,word2)])

        for (word1, word2, word3, word4), prob in quadgram_probs.items():
            condprobs_quad[(word1, word2, word3, word4)] = prob/(split_probs[word1]*condprobs_bi[(word1,word2)]*condprobs_tri[(word1, word2, word3)])
        
        self.PROBS_BIGRAM = condprobs_bi
        self.PROBS_TRIGRAM = condprobs_tri
        self.PROBS_QUADGRAM = condprobs_quad

        return trigrams

    def get_entropies(self, text_split:list)->None:
        prob = 1/len(text_split)
        H = 0
        for i in range(len(text_split)):
            H -= prob * np.log2(prob)
        self.ENTROPY_EQUAL = H

        H = 0
        for prob in self.PROBS_SINGLE.values():
            H -= prob * np.log2(prob)
        self.ENTROPY_ACTUAL = H

        H = 0
        for prob in self.PROBS_BIGRAM.values():
            H -= prob * np.log2(prob)
        self.ENTROPY_BIGRAM = H

    def generate_text_sigle(self, first_word:str, text_split:list)->list:
        newtext = [first_word]
        for i in range(len(text_split)):
            possible_next = {}
            for (w1, w2), prob in self.PROBS_BIGRAM.items():
                if w1 == first_word:
                    if i == 0:
                        print(f"{Fore.GREEN}W1: {w1}{Fore.RESET} | W2: {w2} | {Fore.CYAN}P: {prob}")
                    possible_next[w2] = prob
            
            problist_next = np.array(possible_next.values())
            wordlist_next = np.array(list(possible_next.keys()))
            next_word = wordlist_next[problist_next.argmax()]
            newtext.append(next_word)
            first_word=next_word

        return newtext

    def generate_text_quadgram(self, trigrams:list, first_words:tuple, method:str="deterministic", temperature:float=1.0)->list:
        available_metods = ["deterministic", "random","temperature"]
        if method not in available_metods:
            raise ValueError(f"Method: {method} is invalid, should be one of: {available_metods}")
        newtext = list(first_words)
        first_word = newtext[0]
        second_word = newtext[1]
        third_word = newtext[2]
        for i in range(len(trigrams)):
            possible_next = {}
            for (w1, w2, w3, w4), prob in self.PROBS_QUADGRAM.items():
                if (w1,w2,w3) == (first_word,second_word,third_word):
                    if i == 0:
                        print(f"{Fore.GREEN}W1: {w1} | W2: {w2} | W3: {w3} {Fore.RESET}| W4: {w4} | {Fore.CYAN}P: {prob}{Fore.RESET}")
                    possible_next[w4] = prob
            
            problist_next = np.array(list(possible_next.values()))
            problist_next/=problist_next.sum() 
            wordlist_next = np.array(list(possible_next.keys()))

            if method == available_metods[0]:
                next_word = wordlist_next[problist_next.argmax()]
            
            elif method == available_metods[1] and len(problist_next) >=1:
                next_word = np.random.choice(wordlist_next, p=problist_next)   
            elif method == available_metods[2]:
                probtest_temp = []
                if len(problist_next) > 1:
                    for i, prob in enumerate(problist_next):
                        if i == 0:
                            newp = 1
                        else:
                            newp =(prob**temperature)/sum(probtest_temp)
                        probtest_temp.append(newp)
                else:
                    probtest_temp = [1]

                probtest_temp = np.array(probtest_temp)
                if len(probtest_temp) > 1:
                    probtest_temp/=probtest_temp.sum() 
                next_word = np.random.choice(wordlist_next, p=probtest_temp)   
                
            newtext.append(next_word)
            first_word = second_word
            second_word = third_word
            third_word = next_word
        return newtext

    def store_results(self,text_single:list, text_det:list, text_rand:list, text_temp:list):
        self.PROBS_BIGRAM = {str(key): value for key, value in self.PROBS_BIGRAM.items()}
        data = {"probabilities":self.PROBS_SINGLE,
                "most_probable":self.MOST_PROBABLE,
                "least_probable":self.LEAST_PROBABLE,
                "closest_to_avg":self.CLOSEST_TO_AVG,
                "zipf_correlation":self.ZIPF_CORRELATION,
                "conditional_probs":self.PROBS_BIGRAM,
                "entropy_equal_prob":self.ENTROPY_EQUAL,
                "entropy_actual_prob":self.ENTROPY_ACTUAL,
                "entropy_conditional":self.ENTROPY_BIGRAM}
        
        filename = f"{self.OUTPUT_DIR}/results_{self.FILE_NAME}.json"
        try:
            with open(filename, "w", encoding="utf-8") as file:
                json.dump(data, file, ensure_ascii=False, indent=4)
            print(f"Results successfully saved to {filename}")
        except Exception as e:
            print(f"An error occurred while saving to {filename}: {e}")

        filename = f"{self.OUTPUT_DIR}/{self.OUTPUT_FILE_SINGLE}.txt"
        try:
            with open(filename, "w", encoding="utf-8") as file:
                text = " ".join(text_single)
                file.write(text)
            print(f"Results successfully saved to {filename}")
        except Exception as e:
            print(f"An error occurred while saving to {filename}: {e}")
        
        filename = f"{self.OUTPUT_DIR}/{self.OUTPUT_FILE_DET}.txt"
        try:
            with open(filename, "w", encoding="utf-8") as file:
                text = " ".join(text_det)
                file.write(text)
            print(f"Results successfully saved to {filename}")
        except Exception as e:
            print(f"An error occurred while saving to {filename}: {e}")

        filename = f"{self.OUTPUT_DIR}/{self.OUTPUT_FILE_RAND}.txt"
        try:
            with open(filename, "w", encoding="utf-8") as file:
                text = " ".join(text_rand)
                file.write(text)
            print(f"Results successfully saved to {filename}")
        except Exception as e:
            print(f"An error occurred while saving to {filename}: {e}")

        filename = f"{self.OUTPUT_DIR}/{self.OUTPUT_FILE_TEMP}.txt"
        try:
            with open(filename, "w", encoding="utf-8") as file:
                text = " ".join(text_temp)
                file.write(text)
            print(f"Results successfully saved to {filename}")
        except Exception as e:
            print(f"An error occurred while saving to {filename}: {e}")

    def main(self):
        split = self.split_text()
        probs = self.get_probs(text_split=split)
        self.get_zipf(text_split=split)
        trigrams = self.get_cond_probs(text_split=split)
        self.get_entropies(text_split=split)

        first_words  = random.choice(trigrams)
        fw = first_words[0]

        text_single = self.generate_text_sigle(first_word=fw, text_split=split)
        text_quad_det = self.generate_text_quadgram(trigrams=trigrams,first_words=first_words, method="deterministic")
        text_quad_rand = self.generate_text_quadgram(trigrams=trigrams, first_words=first_words, method="random")
        text_quad_temp = self.generate_text_quadgram(trigrams=trigrams, first_words=first_words, method="temperature", temperature=4.20)

        self.store_results(text_single=text_single, text_det=text_quad_det, text_rand=text_quad_rand, text_temp=text_quad_temp)


if __name__ == "__main__":
    file_names = ['Za_narodov_blagor.txt',
        'Hlapec_Jernej_in_njegova_pravica.txt',
        'Podobe_iz_sanj.txt',
        'Tujci.txt',
        'Gospa_Judit.txt',
        'Hiša_Marije_Pomočnice.txt',
        'Križ_na_gori.txt',
        'Pohujšanje_v_dolini_šentflorjanski.txt',
        'Hlapci.txt',
        'Na_klancu.txt']

    for filename in file_names:
        filename = filename.split(".")[0]
        analiser = TextAnaliser(file_name=filename)
        analiser.main()