[[racunalniski_vid_p8#Poravnava in ujemanje slik | Nadaljevanje od]]

Poznamo stevilna podrocja uporabe transformacij slik:
- geometricna korekcija slik
- spreminjanje velikosti, lege, popacenja
- geometricna egistracija (ujemanje) 2 ali vec slik
- prileganje slike na sliko, ali modela na sliko
- spajanje slik, mozaiki, panorame
## Globalne in lokalne transformacije
Globalne transformacije opravijo enako geometricno transformacijo na vseh pikslih slike
![[Pasted image 20241218083223.png]]
Lokalne transformacije:
- Delujejo samo na doloceno poddomeno slike
- So lahko razlicne za razlicne dele slike
## Izvor slike in 2D koordinate
Vedno, ko govorimo o slkovnih transformacijah, smatramo, da imamo izvor slike v levem zgornjem kotu,. Smatramo, da je koordinatni sistem __desnosucni__

![[Pasted image 20241218083435.png]]

Uporaba transformacije je _ekvivalentno_ opravi inverza te transformacije na koordinatnem sistemu

## Osnovne transformacije
- _Translacija:_ premik koordinatnega sistema
- _Evklidska:_ poleg translacije vkljcuje se rotacijo, torej spremeni __lego slike__ 
- _Podobnostna:_ poleg prejsnjih parametrov spremeni tudi skaliranje
- _Afina:_ Ne ohranja kotov, amoak ohranja vzporednost crt, (prevokotnik spremeni v paralelogram)
- _Projektivna:_ trapezoidno preoblikovanje
![[Pasted image 20241218083923.png]]
### Translacija
$$\begin{bmatrix}u \\v \end{bmatrix} =  \begin{bmatrix}x \\y \end{bmatrix}+ \begin{bmatrix}x_1 \\y_1 \end{bmatrix}$$
### Rotacija
- Rotacija okoli izvora

$$\begin{bmatrix}u \\v \end{bmatrix} =  \begin{bmatrix}cos(\theta)  & -sin(\theta) \\sin(\theta)  & cos(\theta)\end{bmatrix}\cdot \begin{bmatrix}x \\y \end{bmatrix}$$
### Translacija plus rotacija

$$\begin{bmatrix}u \\v \end{bmatrix} =  \begin{bmatrix}cos(\theta)  & -sin(\theta) \\sin(\theta)  & cos(\theta)\end{bmatrix}\cdot \begin{bmatrix}x \\y \end{bmatrix} + \begin{bmatrix} x_l \\ y_l \end{bmatrix}$$
- Primer te transformacije je vrtenje slike okoli centra ali poljubne tocke
	1. Definiramo matriko $T$, ki nam premakne izhodisce koordinatnega sistema v sredisce slike
$$T = \begin{bmatrix} 1 & 0 & -x_c \\0 & 1 & -y_c \\ 0 & 0 & 1\end{bmatrix}$$
	2. Definiramo matriko $R$, ki bo matriko obrnila za poljuben kot
$$R = \begin{bmatrix}cos(\theta)  & -sin(\theta) & o\\sin(\theta)  & cos(\theta) & 0 \\ 0 & 0 & 1\end{bmatrix}$$
	3. Definiramo matriko $T^{-1}$ , ki nam sliko premakne nazaj v originalno koordinatno izhodisce
$$T = \begin{bmatrix} 1 & 0 & x_c \\0 & 1 & y_c \\ 0 & 0 & 1\end{bmatrix}$$
![[Pasted image 20241218085232.png]]

## Uniformno in arbitrarno skaliranje
 Mnozenje koordinat piksslov z dolocenim faktorjem
 - _Uniformno skaliranje:_ Vse koordinate so pomnozene z istim skalirnim faktorjem, ohrani originalno obliko slike
 - _Arbitrarno skaliranje:_ t.i. raztezanje, koordinate so pomnozene z razlicnimi sklairnimi faktorji, ne ohranja oblike slike
 $$S = \begin{bmatrix} s_x & 0 &0 \\
 0 & s_y & 0 \\
 0 & 0 & 1\end{bmatrix}$$

## Pregled 2D transformacij
![[Pasted image 20241218090210.png]]

## Uporaba transformacij
Transformacije vecinoma uporabljamo, ko zelimo poravnati sliko $f(u,v)$ na sliko $g(u,v)$ 
- Polozaj piksla po transformaciji najverjetneje ni celo stevilo, vendar bi moral biti, saj so slike diskretne mreze celih stevil
- Ce bi vrednost koordinate samo zaokrozili na najblizje celo stevilo, bi lahko prisli do dolocenih problemov, kot npr. da bi se 2 piksla mapirala na isto lokacijo, ali da se _noben_ piksel ne mapira na doloceno lokacijo

### Proces odpravljanja problema ne-celih lokacij pikslov po transformaciji

#### Inverzna transformacija
Po transformaciji opravimo se inverzno transformacijo in tam pogledamo, koliksna je bila originalna vrednost tega piksla in jo popravimo na vrednost njenega __najblizjega soseda__

#### Interpolacija
- _Bilinearana:_ Priporocena metoda, 
	1. Linearna interpolacija vzdolz obeh $x$ osi
	$$\begin{gather} f(x,j) = f(i,j) \cdot(1-\Delta x) + f(i+1, j) \cdot \Delta x \\
	f(x,j+1) = f(i,j+1) \cdot(1-\Delta x) + f(i+1, j+1) \cdot \Delta x \end{gather}$$
	2. Linearna interpolacija po osi $y$ 
	$$f(x,y) = f(x,j) \cdot(1-\Delta y) + f(x, j+1) \cdot \Delta y$$
	3. Koncno mapiranje vrednosti piksla
	$$g(i', j') = f(x,y)$$
## Motivacija za ujemanjem
- Imamo referenco in cilj
- Naloga je, da 'pojasnimo' tarco glede na referenco
- Za dosego tega, prilegamo referenco na cilj
- Specificno iscemo transformacijo, ki opravi to prileganje

## Prileganje, ujemanje, registracija
### Prileganje premice z metodo najmanjsih kvadratov
- Model/_referenco_ nam predstavlja enacba premice $y = kx + n$
- referenco zelimo prilegati podatkom , ki so b obliki nabora tock (vec kot 2 tocki)
- Zaradi suma, podatki ne nujno ustrezajo referenci
- Zato iscemo parametre premice $(k, n)$, ki minimizirata cenilno funkcijo:
$$E(k,n) = \sum_{i=1}^n e^2_{i} = \sum_{i=1}^n (y_i - kx_i -n)^2$$
- Kje $(x_i, y_i)$ predstavljata lokacije tock v naboru podatkov
- Ti metodi pravimo metoda __najmanjsih kvadratov__
- Vhodni podatki so lahko multidimenzionalni, metodo lahko uporabljamo tudi za prileganje polinomov

#### Robustnost najmanjsih kvadratov ob prisotnosti suma
- Metoda najmanjsih kvadratov je zelo obcutljiva na __grobe napake__,
- Samostojni veliki outlierji lahko mocno vplivajo na rezultat prileganja
- Resitev je predhodna odstranitev velikih outlierjev
![[Pasted image 20241218101311.png]]

### RANSAC
__Ran__ dom __Sa__ mple __C__ onsensus
- Fundementalno razlicen od metode najmanjsih kvadratov
- Vzame najmanjso mozno velikost vzorca za ocenitev parametrov modela, namesto najvecje mozne
![[Pasted image 20241218101542.png]]

- Rumene tocke na sliki jasno razvidno podpirajo model prileganja crte, medtem ko modre ne
Algoritem:
1. Vzorcimo nakljucen nabor tock (ravno dovolj, da lahko prilegamo referenco)
![[Pasted image 20241218103157.png]]
2. Pridobimo parametre reference, ki ustreza prileganju, na le tem naboru tock
![[Pasted image 20241218103215.png]]
3.  Ocenimo kvaliteto prileganja, najdemo najvecji mozen nabor tock, ki podpira to referenco (v tem primeru 7 tock znotraj dovoljene deviacije od reference)
![[Pasted image 20241218103242.png]]
4. Ponovi, dokler ne najdes reference z zadostnim zaupanjem

#### Izbira parametrov za RANSAC
- Zacetno stevilo tock (velikost vzorca $s$), tipicno minimalno stevilo tock, potrebnih za prileganje modela (v primeru premice 2 tocki)
- Distancna meja deviacije $t$, je izbrana tako, da je verjetnost za inlierje velika (cca 95%)
- Stevilo iteracij $N$ je izbran na bazi verjetnosti, da je vsaj en vzorec brez outlierjev

## Ujemanje slike brez znacilk
Ne moremo uporabljati metod [[#Prileganje premice z metodo najmanjsih kvadratov | najmanjsih kvadratov]] in [[#RANSAC | RANSAC]]

Resitev je t.i. __template matching__
- Izberemo transformacijo
- Eno sliko uporabimo kot referenco in jo prilegamo drugi, _ciljni_
- Definiramo kriterijsko funkcjo __podobnosti__
- Poiscemo optimalno resitev (parametre transformacije), glede na rezultate kriterijske funkcije
- Transformiramo eno sliko tako, da jo prilegamo na referencno
