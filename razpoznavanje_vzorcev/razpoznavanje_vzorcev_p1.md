# Terminologija
1. Spoznavanje, zaznavanje, razpoznavanje:
	- **Zaznavanje** je baza za  **spoznavanje**, saj moramo zaznavati svoje okolje, za stvaritev _relevantnih konceptov_ glede tega. Medtem ko  je **razpoznavanje** proces _aplikacije ze spoznanih vzorcev na nov nabor podatkov_ 
2. Vzorec
	- Manjsa kolicina _podatkov, ki kazejo neke znacilnosti vrste, celote_

## Okolje
Okolje je _mnozica_ __objektov v prostoru in casu__, ki jih razpoznavamo $$\mathcal{O = OB\space \cup \space ZO}$$kjer sta $\mathcal{OB}$ _mnozica objektov razpoznavanje_ in $\mathcal{ZO}$ _mnozica zvez in odnosov med temi objekti_

## Področje uporabe
Pri snovanju razpoznavalnih sistemov omejimo splošno okolje na ožje _področje uporabe_: $$ \mathcal{PU} \subset \mathcal{O} $$ kjer $\mathcal{PU}$ vsebuje samo tiste objekte $o_k \in \mathcal{OB}$ in njihove odnose $z_j \in \mathcal{ZO}$, ki jih razpoznavamo.
Mnozica  $\mathcal{PU}$ je dolocena z __nalogo razpoznavalnega sistema__

## Razred objektov
Področje uporabe pogosto določa množica objektov $\mathcal{OB}$, ki pripadajo razredu objektov: $$ \mathcal{OB_i} \subset \mathcal{OB}, \quad i = 1,2, \dots, M $$ kjer vsak razred objektov ustreza oznaki $\omega_i$ iz množice oznak $\Omega = \{\omega_1, \omega_2, \dots, \omega_M\}$. 

Primer: _splosen pojem "sadje"_  sestavljajo *osnovni stvarni pojmi:* jabolko, hruska, sliva, marelica

## Vzorec
Vzorec je _vsebina čutil_ (odčitek merilnih naprav), ki daje razpoznavalniku podatke o objektu ali o njihovih medsebojnih odnosih: $$ \mathbf{f_k(x)} = \begin{bmatrix} f_{k1}(x_1, \dots, x_q) \\ f_{k2}(x_1, \dots, x_q) \\ \vdots \\ f_{kp}(x_1, \dots, x_q) \end{bmatrix} $$ Kjer sta $p$ in $q$ odvisna od sistema senzorjev., ki jih razpoznavalni sistm uporablja. Za _dano odrocje uporabe sta stalni_

## Razred vzorcev
Razred vzorcev $C_i$ sestavljajo *vzorci, ki so slike objektov iz razreda* $\mathcal{OB_i}$: $$ C_i \cap C_j = \emptyset, \quad \forall i \neq j $$ Vsak vzorec iz razreda $C_i$ je bolj podoben drugemu vzorcu iz $C_i$ kot kateremukoli vzorcu iz $C_j$ za $i \neq j$

Preslikava, ki _preslika objekt_ razpoznavanja v _vzorce_ mora biti taksna, da _tuje razrede objektov_ preslika v _tuje razrede vzorcev_

## Učna množica vzorcev
Učna množica vzorcev je konzna mnozica vzorcev iz daneg apodrocja uporabe $\mathcal{PU}$, iz katere se _stroj nauci zvez_ med oznakami razredov in med _objekti razpoznavanja_. Je par: $$ \mathcal{U_M} = (\mathcal{S_N}, \Omega) $$ kjer $\mathcal{S_N}$ predstavlja množico vzorcev, ki opisujejo $\mathcal{PU}$, oznake razredov objektov pa so $\Omega = \{\omega_1, \omega_2, \dots, \omega_M\}$. 


## Učenje
Učenje je *proces, v katerem se vzpostavijo zveze med vzorci iz učne množice in oznakami razredov vzorcev*. Matematično je razpoznavanje vzorcev funkcija: $$ RPV: f_k(x) \to \omega_l $$ za preproste vzorce, in $$ RZV: f_k(x) \to \lambda_k $$ za zapletene vzorce.

## Razvrščanje vzorcev  
Razvrščanje je proces dodeljevanja vzorca enemu izmed $M$ razredov:  
- **S prileganjem**: vzorec se razvrsti v razred, katerega prototipu je najbolj podoben.  
- **Z odločanjem**: vzorec se razvrsti na podlagi vrednosti odločitvenih funkcij.  
- **S stavčno analizo**: vzorec je dodeljen razredu, katerega slovnica ga lahko ustvari.  
- **S sklepanjem**: razred določimo z logičnim sklepanjem.

## Računska zapletenost algoritmov razpoznavanja  
Časovna zahtevnost algoritmov razpoznavanja v splošnem narašča eksponentno s številom podatkov v zapisu vzorca.  
Zato zahtevamo:  
1. **Omejena časovna zahtevnost** – algoritmi naj bodo omejeni s polinomom.  
2. **Zanesljivost razpoznavanja** – naj bo primerljiva s človeško zanesljivostjo.  

Eden izmed pristopov je **hierarhično razpoznavanje**, kjer se problem razdeli na zaporedje delnih razpoznavanj.  
Drug pristop temelji na **logičnem sklepanju**, kjer problem razstavimo na podprobleme in z logičnimi pravili določimo prehode med stanji sklepanja.

## Razvrstitev postopkov razpoznavanja  
Postopki razpoznavanja se delijo na:  
1. **Postopki s prileganjem** – primerjava vzorca s prototipi razredov.  
2. **Razpoznavanje v vektorskem prostoru značilk** – uporaba odločitvenih funkcij.  
3. **Strukturni postopki** – uporaba strukturiranih množic oznak in stavčne analize.  
4. **Metode umetne inteligence** – uporaba nevronskih mrež, fuzzy logike itd.  
5. **Hibridni postopki** – kombinacija več različnih metod.

## Določanje značilk vzorcev  
Značilke vzorca so ključne lastnosti, na podlagi katerih lahko razpoznavalnik razlikuje med razredi objektov.  

Obstajata dva glavna pristopa k določanju značilk:  
1. **Hevristični pristop** – značilke določimo na podlagi poznavanja področja uporabe.  
   - Primer: Trikotnike razlikujemo od pravokotnikov glede na število stranic, ne pa glede na dolžino stranic.  
2. **Matematični pristop** – značilke določimo z minimizacijo verjetnosti napačnega razvrščanja ali z optimizacijo kriterijskih funkcij.

Če je vzorec predstavljen z $n$ značilkami, ga lahko matematično zapišemo kot vektor v **Evklidovem prostoru**:  

$$  
f(x) = (x_1, x_2, \dots, x_n) \in \mathbb{R}^n  
$$  

Značilke so lahko:  
- **Zvezne** – vrednosti iz množice realnih števil ($\mathbb{R}$).  
- **Diskretne** – vrednosti iz končne množice predpisanih vrednosti (npr. {majhen, srednji, velik}).  
- **Jezikovne (fuzzy)** – neizrazite vrednosti, kot so "malo", "srednje", "veliko".  

## Evklidov prostor značilk  
Evklidov prostor značilk je **$n$-razsežni realni metrični vektorski prostor**, kjer definiramo skalarni produkt dveh vektorjev značilk:  

$$  
\langle f(x), g(x) \rangle = \sum_{i=1}^{n} x_i g_i  
$$  

Če predpostavimo, da značilke v tem prostoru tvorijo **strnjene roje podatkov**, lahko s pomočjo **ločilnih mej** ločimo razrede vzorcev.


## Odločitvene funkcije  
Razredi vzorcev v prostoru značilk lahko opišemo z odločitvenimi funkcijami, ki delijo prostor na regije:  

$$  
g_i(f(x)) = w_i^T f(x) + b_i  
$$  

Vzorec pripada razredu z največjo vrednostjo odločitvene funkcije:  

$$  
C = \arg\max_{i} g_i(f(x))  
$$  

V praksi določimo **hiperploskve**, ki ločujejo razrede v prostoru $\mathbb{R}^n$.  

## Razvrščanje vzorcev z odločitvenimi drevesi  
Namesto enostavne ločitve z odločitvenimi funkcijami lahko uporabimo **odločitvena drevesa**, kjer se odločanje izvaja zaporedno glede na vrednosti značilk.

Primer odločitvenega drevesa za razpoznavanje sadežev:
- **ČE** je barva oranžna, **POTEM** sadež = pomaranča.  
- **ČE** je barva rumena, **POTEM** sadež = limona.  

To lahko zapišemo tudi v obliki pravil:
```prolog
je_pomaranča(X) :- ima_barvo(X, oranžna).
je_limona(X) :- ima_barvo(X, rumena).
```

## Model razpoznavalnika vzorcev
![[Pasted image 20250228094756.png]]

# Razclenjevanje vzorcev
## Enote razpoznavanja govornega signala
Najmanjsa pomensko samostojna enota _povedi_ je _beseda_
- Razclenjevanje ovor ana besede je _razmeroma preprosto_, ce se posamezne besede izgovarjajo _loceno_
- Besede pogosto izgovarjamo _brez premorov_, kar zelo otezi ali celo onemogoci razclenjevanje na besede
- Najmanjsi gradnik govora je _fonem ali glas_, po katerem se lahko ena bseda po pomenu loci od druge

## Razčlenjevanje govora  
### Razčlenjevanje govora na besede  
- Če so besede jasno izgovorjene s **premori**, jih lahko enostavno razpoznamo.  
- Če so besede izgovorjene **brez premorov**, postane njihovo razčlenjevanje težavno.

### Razčlenjevanje govora na zloge  
- V besedi je običajno toliko zlogov, kot je **samoglasnikov**.  
- **Glasnost govora** doseže lokalni maksimum nad **jedrom zloga (samoglasnikom)** in lokalni minimum med sosednjima zlogoma.  
- Zaradi velikega števila različnih zlogov je njihovo **razvrščanje težko**.

### Razčlenjevanje govora na alofone  
- Glasovi **pridobijo različne oblike** glede na okolico (trajanje, glasnost, zven).  
- Obstaja **več tisoč alofonov**, a strokovnjaki jih prepoznajo **približno 200**.  
- Razčlenjevanje na **alofone je lažje** kot razčlenjevanje na glasove.

## Postopki razčlenjevanja govornega signala  
- **Merjenje kratko-časovne glasnosti** in **števila prehodov skozi ničlo** omogoča osnovno delitev signala na **povedi** in **premore** (zaradi dihanja).  
- Pri pripravi **učne množice** govornih vzorcev se **govorni signali ročno razčlenijo** in **transkribirajo**.

### Razčlenjevanje govornega signala na izseke  
Govorni signal se deli na **kratke segmente** dolžine **10-30 ms** s prekrivanjem **5-10 ms**.  
- Ti segmenti so krajši od **najkrajšega glasu**, a dovolj dolgi za zajemanje **kratko-časovnih spektralnih značilnosti**.

## Razčlenjevanje slik  
Razčlenjevanje slik temelji na **ugotavljanju področij** ali **obrisov**.  

### Razčlenjevanje z ugotavljanjem področij  
- Slika je sestavljena iz **povezanih slikovnih elementov** – področij, ki so enovita glede na **svetilnost, barvo ali teksturo**.  
- **Področja se ne prekrivajo**, njihova **unija pa je enaka celotni sliki**.  

Področja na sliki določamo s:  
- **Upragovljanjem** – določitev **praga svetilnosti**, ki loči **predmet od podlage**.  
- **Neposrednim določanjem področij**.  
- **Združevanjem slikovnih elementov**.

### Razčlenjevanje z ugotavljanjem obrisov  
Obrisi objektov so ključni za **razpoznavanje in tolmačenje prizora**.  
- Obrise določamo **z iskanjem naglih sprememb svetilnosti** slikovnih elementov.  
- Postopki temeljijo na **odvajanju slikovne funkcije**.
