# Barva
## Viri svetlobe
1. Inkandescenca: _Oddajanje svetlobe zaradi temperature (navadne zarnice)_
2. Elektroluminescenca: _Polprevodniki oddajajo svetlobo zaradi elektrocnega vzbujanja_
3. Fluorescenca: _Elektroni vzbudijo material, ki energijo sprosti kot vidno svetlobo (neonske zarnice, fosfor na CRT)_
4. Kemiluminescenca, Bioluminescenca, ...
## Planckov zakon
Sevanje crnega telesa
$$L(\lambda, T) = \frac{2hc^2}{\lambda^5e^{\frac{kc}{k\lambda T}}-1}[W\cdot sr^{-1}\cdot m^{-3}]$$
__Kjer so:__
#todo dopolni


## Senzorji v barvnih kamerah
- Posebne razporeditve ki nam omogocajo da za vsak piksel dobimo barvne vrednosti
	- __3CCD__ ima prizmo, ki svetlobo razbije na 3 osnovne komponente in vsako od njih poslje na svoj senzor
	- __Layered image sensor
![[Pasted image 20241106095822.png]]

V vecini senzorjev uporabljamo t.i. _Bayerjev vzorec_ mikrofiltrov, ki prekriva celoten senzor, vsak piksel ima pred sabo ali R, ali G, ali B filter
![[Pasted image 20241106095952.png]]

Za pridobitev dejanske RGB slike uporabljamo postprocesiranje z racunalnikom, ki interpolira med svetlobnimi vrednostmi sosednjih _subpikslov_


## Odboj, izgled povrsine
Spekter svetlobe, ki se odbije od predmeta je odvisna od:
- Spektra svetlobe, ki osvetljuje predmet (E)
- Odbojnih lastnosti povrsine predmeta/materiala (R)
$$L(\lambda) = E(\lambda) R(\lambda)\quad [\frac{W}{m^2}]$$
__Primer: kaj odseva rdeca opeka?__
![[Pasted image 20241106100807.png]]
Kjer je:
- __E($\lambda$)__ soncna svetloba na povrsini
- __R($\lambda$)__ refletivnost opeke
- __L($\lambda$)__ soncna svetloba, ki jo je opeka odbila

_Nasa percepcija odboja svetlobe je poleg zgoraj navedenih parametrov odvisna tudi od_ __obcutljivosti nasega ocesa__

## Tristimulus in metamerizem
Svetlobni receptorji integrirajo cez spekter, rezultat integracije so 3 barvni stimulusi - __tristimulus__. Ljudje smo trikromati, torej dojemamo 3 razlicne barve.
$$\begin{gather}
\rho = \int L(\lambda)M_R(\lambda)d\lambda\\
\gamma = \int L(\lambda)M_R(\lambda)d\lambda\\
\beta = \int L(\lambda)M_R(\lambda)d\lambda
\end{gather}$$
Posledicno, povrsine, ki odbijajo $\rho, \gamma \space in \space \beta$ v enakem razmerju, izgledajo enake barve, ne glede na njihov dejanski spekter. Ta pojav imenujemo __metamerizem__.

## Barvna reprodukcija
Najosnovnejsa oblika vizualnega stimulusa je lahko generirana samo s 3 osnovnimi komponentami. Obstaja vec naborov primarnih komponent, edini faktor ki nas pri izbiri omejueje je, da __tretja primarna kompnenta ne more biti poustvarjena s kombinacijo ostalih 2__

_Konsenz CIE leta 1976 je dolocil en nabor primarnih barv:_
- $\color{red} Rdeca=700 nm$
- $\color{green}Zelena = 546.1nm$
- $\color{blue} Modra=435.8nm$


## Zaznava barve
Vrednosti tristimulusa zakodirajo barvo in svetlost. Za doseganje enake svetlosti moramo normalizirati vrednosti, da je njihov sestevek enak 1
$$\begin{gather}
r = \frac{R}{R+G+B} && g = \frac{G}{R+G+B} && b = \frac{B}{R+G+B}
\end{gather}$$
Z uporabo te omejitve postane ena komponenta redundantna. Z eliminacijo intenzitete postaneta 2 komponenti zadostni za predstavo barve

__Kromatski diagram__
- Notranji del podkvaste regije predstavlja barve, ki jih lahko zazna clovesko oko
- Barve znotraj crtkanega trikotnika lahko reproduciramo z uporabo primarnih, ki predstavljajo _ogljisca trikotnika_
![[Pasted image 20241113083527.png]]

__Z izbranim naborom primarnih barv ne moremo reproducirati vseh barv, ki jih clovesko oko lahko zazna__

## RGB in XYZ
Zavoljo reprezentacije vseh barv, ki jih lahko ljudje vidimo je bila ustvarjena transformacijska funkcija primarnih komponent __x, y, z__ ki popolnoma pokrijejo vidni spekter cloveskega ocesa
$$\begin{gather}
X = \int L(\lambda) \overline x(\lambda)d\lambda \\
Y = \int L(\lambda) \overline y(\lambda)d\lambda \\
Y = \int L(\lambda) \overline z(\lambda)d\lambda \\
\end{gather}$$
Pravila za dolocilo primarnih barv:
- Komponente morajo biti nenegativne
- Enaka kolicina vseh primarnih komponent mora ustvariti _belo svetlobo_
- Ucinkovitnostna krivulja komponente Y mora slediti obcutljivostni krivulji cloveskega ocesa

![[Pasted image 20241113084324.png]]

### Kromatski diagram XY
3D prostor XYZ je tezko predstaviti na 2D ravnini, za opis barve sta zadostni 2 normalizirani koordinati, sprememba v intenziteti ne spremeni barve obcutno

$$\begin{gather}
x = \frac{X}{X+Y+Z} && y = \frac{Y}{X+Y+Z} && z = \frac{Z}{X+Y+Z}
\end{gather}$$

![[Pasted image 20241113084526.png]]

![[Pasted image 20241113084933.png]]

- Podkvasta regija na diagramu predstavlja vse barve, ki jih clovesko oko lahko zazna (gamut)
- Mesanica 2 barv, naprimer A in B lahko poustvari vse barve vzdolz daljice AB (gamut je crta)
- Mesanica vseh treh komponent lahko poustvari katerokoli barvo znotraj trikotnika (gamut je trikotnik)
- En trikotnik ne more pokrivati celotnega spektra cloveskega ocesa
- __Enaki kolicini komponent A in B ne poustvarita barve, ki lezi na sredini med njima
- __Barvni prostor torej ni perceptualno homogen ali uniformen__

#TODO dopolni barvne prostore

## Nadaljne tezave z barvo v racunalniskem vidu
- Ljudje imamo posebno sposobnost, ko lahko razlocimo barve, ki so si zelo podobne, vendar le ko sta si prostorsko blizu
- Obstaja vprasanje "kaj je belo?", povezano z whide balancem v fotografiji. Obstaja vec vrst bele svetlobe 

# Obdelava slike
Namen:
- Stvaritev slike, ki je v nekem aspektu boljsa od originalne in s tem boljsa za nadaljno obdelavo
- Vcasih temu recemo _predobdelava slik_

Tipicni cilji obdelave slik:
- Zmanjsanje suma, izboljsanje razmerja signal/sum (meglenje, filtriranje)
- Izboljsanje svetlosti/kontrasta za kompenzacijo variacije v njih
- Zmanjsanje velikosti datotek, oziroma _kompresija_ preden sliko posredujemo obdelovalniku
- Normalizacija slike, geometricno ali fotometricno (kalibracija)

## Izboljsanje slike
Imamo sliko, ki potrebuje izboljsnje, vecinoa to pocnemo ko so misljene za opazovanje s cloveskim ocesom, npr.:
- Manipulacija vrednosti pikslov za izboljsanje vidnosti detajlov, kontrast, barvo
- Filtriranje za izboljsavo suma, morfoloski filtri
## Restavracija slike
Iz degradirane slike zelimo dobiti originalno, to storimo na bazi _degradacijskega modela_ s katerim lahko predvidimo kako deluje proces degradacije slike.

Pristopi:
- Unsharp masking za izboljsavo kontrasta
- Dekonvolucija
- Wiener filtriranje

Vcasih se restavracijo tretira kot poseben tip  [[#Izboljsanje slike|izboljsanja]]

## Analiza slike
Sliko analiziramo za ekstrakcijo pomembnih informacij iz slike

Pristopi:
- Segmentacija
- Detekcija /lokalizacija
- Zaznavanje in izlocanje znacilk
- Zaznavanje robov
- Analiza oblike, teksture in izgleda
__Cilj analize slike je kvantitativen opis slike__


# Predobdelava slike
Locimo jo na vec kategorij

- Tockovne operacije
	- Piksel $\mapsto$ piksel
	- Aritmeticne in logicne operacije (+,-,*, /, AND, OR, ...)
- Lokalne operacije
	- Lokalno obmocje $\mapsto$ piksel
	- linearno in nelinearno filtriranje za zmanjsanje suma
- Globalne operacije
	- Celotna slika $\mapsto$ rezultat
	- Rezultat je odvisen od celotne slike
	- Npr. histogram

## Tockovne operacije
Vrednost izhodnega piksla $I_{out}(i,j)$  je odvisna izkljucno od njegove vhodne vrednosti $I_{in}(i,j)$
$$I_{out}(i,j) = T\cdot I_{in}(i,j)$$
Primer:
$$I_{out}(i,j) = a*I_{in}(i,j) + b$$
kjer je a prilagajanje kontraska, b pa prilagajenje intenzitete
V teoriji bi parametra a in b lahko bila razlicna za vsak piksel

### Svetlost
Sprememba svetlosti 
$$I_{out}(i,j) = I_{in}(i,j)+k$$
![[Pasted image 20241113101544.png]]

Razvidno je, da se je na sliki izgubila informacija, saj se je desni del grafa eliminiral s posvetljevanjem (clipping)

### Kontrast
Sprememba kontrasta
$$I_{out}(i,j) = k\cdot I_{in}(i,j)$$
![[Pasted image 20241113101750.png]]

Kot pri primeru s [[#Svetlost|svetlostjo]], nismo pridobili nobene informacije, ter jo celo izgubili, saj je prislo do clippinga na obeh koncih spektra

### Inverzija in upragovanje
$$\begin{gather}
Inverzija: I_{out}(i,j) = 255-I_{in}(i,j) \\ Upragovljanje: I_{out}(i,j) = (I_{in}(i,j)>t) ; t=treshold
\end{gather}$$
![[Pasted image 20241113102238.png]]

### Splosna linearna transformacija
$$I_{out} = (I_{in}-c)\frac{b-a}{d-c}+a$$
Kjer so: 
- $I_{out}$  izhodna svetlost
- $I_{in}$ vhodna svetlost
- $d$ maksimalna vhodna vrednosti
- $c$ minimalna vhodna vrednost
- $b$ maksimalna izhodna vrednost
- $a$ minimalna izhodna vrednost

### Gamma korekcija
Izhaja iz nelinearnosti CRT zaslonov
- Razmerje med svetlostjo ekrana in apliciranega elektricnega signala je eksponentna
- Svetlobna obcutljivost cloveskega ocesa je prav tako nelinearna
 ![[Pasted image 20241113102716.png]]
 - Preslika ozko svetlo ali temno obmocje v sirse obmocje in s tem posvetli ali potemni sliko
 - Parameter je $\gamma$
	 - Konstanta c je izbrana tako, da se funkcija zacne v zgornjem levem in konca v spodnjem desnem vogalu slike
	 - Konvecnionalna vrednost za gammo je 2,2 za CRT monitorje in 1/2.2 za kamere
	 - Vcasih je korekcija gamme zlorabljena za nelinearno prilagojene svetlostne nivoje, ceprav ne operiramo s CRT zaslonom
__Primer:__
![[Pasted image 20241113103129.png]]

### LUT za tockovne operacije
LUT pomeni _Look Up Table_

Operacija je mozna, ko so vrednosti pikslov kvantizirane. Operacija obcutno pospesi operacije

![[Pasted image 20241113103337.png]]

## Slikovna aritmetika
Sestevanje slik:
- Vecinoma to pocnemo da popravimo razmerje signal/sum
- Npr: sestevek sekvence temnih slik stacionarnega objekta

Odstevanje slik:
- Sprememba detekcije
- Odstranitev ozadja
- Evalvacija, kje se sliki razlikujeta

### Sestevanje slik
Primer:
- Imamo N slik stacinarne scene
- Slike imajo sum, ki je nepovezan s samo obliko slike

Izracunamo novo sliko $I$, kot srednjo vrednost vseh slik
$$I = \frac{I_1+I_2+\cdots+I_N}{N}$$
Varianca suma po tej operaciji pade za faktor N, njegova standardna deviacije pa za faktor $\sqrt{N}$
$$\sigma_1 = \frac{\sigma}{\sqrt{N}}$$
__Primer sestavanja slik:__
![[Pasted image 20241113104744.png]]
