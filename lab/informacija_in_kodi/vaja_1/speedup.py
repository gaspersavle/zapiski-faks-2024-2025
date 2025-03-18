import wave
import numpy as np
from collections import Counter
import math
import matplotlib.pyplot as plt

DEBUG = False

def split_in_tuples(file, tuple_size):
    output = []
    for i in range(0, len(file), tuple_size):
        output.append(str(file[i:i+tuple_size]))

    return output

def calculate_entropy(count):
    probabilities = {}
    total_count = sum(count.values())
    for key, value in count.items():
        probabilities[key] = value/total_count
     
    entropy = 0
    for p in probabilities.values():
        if p !=0:
            entropy += p*math.log2(p)
        
    return -entropy






DEBUG = True
sound = np.fromfile("./datoteke/posnetek.wav", dtype="uint8")

entropies_sound_wav = {}

for order in range(1,6):
    sound_split = split_in_tuples(sound, order)
    if DEBUG:
        print(sound_split[:10])
    frequencies_split = Counter(sound_split)
    entropy_split = calculate_entropy(frequencies_split)
    entropies_sound_wav[order] = entropy_split/order
    
for key, value in entropies_sound_wav.items():
    print(f"{key} order entropy(uncompressed): {value}")
    
print("\n")
    
sound = np.fromfile("./datoteke/posnetek.mp3", dtype="uint8")

entropies_sound_mp3 = {}

for order in range(1,6):
    sound_split = split_in_tuples(sound, order)
    if DEBUG:
        print(sound_split[:10])
    frequencies_split = Counter(sound_split)
    entropy_split = calculate_entropy(frequencies_split)
    entropies_sound_mp3[order] = entropy_split/order
    
for key, value in entropies_sound_mp3.items():
    print(f"{key} order entropy(mp3): {value}")
    
print("\n")
    
sound = np.fromfile("./datoteke/posnetek.flac", dtype="uint8")

entropies_sound_flac = {}

for order in range(1,6):
    sound_split = split_in_tuples(sound, order)
    if DEBUG:
        print(sound_split[:10])
    frequencies_split = Counter(sound_split)
    entropy_split = calculate_entropy(frequencies_split)
    entropies_sound_flac[order] = entropy_split/order
    
for key, value in entropies_sound_flac.items():
    print(f"{key} order entropy(flac): {value}")
