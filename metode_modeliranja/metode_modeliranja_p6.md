Nadaljevanje iz [[metode_modeliranja_p5#Hidravlicni sistemi - linearizacija | prejsnjega predavanja]]

Pri numericni linearizaciji z uporabo racunalniskih orodij moramo paziti, da uporabljamo _najmanjse mozne perturbacije_, vendar  ormo pri tem paziti na posebnosti dolocenih sistemov, kjer bi lahko prislo do tega, da je perturbacija premajhna, da bi iz nje dobili nek izhod, kar lahko rezultira v tem, da __perturbacija nima vpliva na izhod sistema.__ 

Primer:
- Lepenje pri potiskanju klade s silo, ki je manjsa od sile lepenja
- Vzbujanje diode s perturbacijo, katere napetost je manjsa od kolenske napetosti diode

## Vrednotenje matematicnih modelov

Vsakemu postopku modeliranja sledi faza _vrednotenja_:
- Opredelitev ali je model ustrezen (ali zadosca vsem ciljem nacrtovanja)
- Tezavnejsi del naloge, saj ni predpisanega postopka, ki bi z gotovostjo opredelil uspesnost ali kvaliteto modela
- Ali model zadosca ciljem nacrtovanja, obicajno opredelimo sele po dolgotrajnejsi uporabi modela, ki odkrije bodisi njegove pomanjkljivosti ali nas preprica v svojo uspesnost

Kompleksnejse modele _delno vrednotimo_ ze med samim postopkom modeliranja. Delno vrednostenje usmerja modelerja med delom, s cimer pride do postopne izboljsave in zaupanje v rezultate modeliranja

![[Pasted image 20241119122548.png]]

Z delnim vrednotenjem:
- Skusamo pretehtati ustreznost uporabljenih informacij, predpostavk in podatkov
- Susamo izbrati primerne _metodologije gradnje modela_ kjer so pogosto mozne razlicne poti, kjer je vodilo lahko: 
	- informativnost rezultata
	- razlagalna moc rezultata
	- prirocnost uporabe
- K delnemu vrednotenju mocno pripomore ustrezno nacrtovano izvajanje eksperimentov
- Ustreznost modela ocenjujemo tudi na podlagi _opazovanja njegove strukture_
- Pomembne so tudi razlicne _medsebojne primerjave odzivov modelov_ in odzivov _opazovanega sistema_

Vrednotenje obicajno poteka na 2 nacina:
1. Z vizualno primerjavo simulacijskih in merjenih pdatkov, npr.:
	- Ujemanje odzivov pri enakih vzbujanjih
2. S kvantitativnimi metodami, med katere stejemo:
	- Razlicne integralske kriterije
	- funkcije ustreznosti (fitness function)
	- koeficiente ujemanja
	- ...

### Vizualno vrednotenje
Primerjava simulacijskih in merjenih rezultatov

![[Pasted image 20241119123120.png]]

### Kvantitativni kriteriji vrednotenja:
- Integralske cenilke:
$$\begin{gather}
J_1 = \int_0 ^{TFIN} e^2 dt \\
J_2 = \int_0 ^{TFIN} |e|dt \\
J_3 = \int_0 ^{TFIN} te^2 dt \\
J_4 = \int_0 ^{TFIN} t|e|dt
\end{gather}$$
- Kriterij ugotavljanja podobnosti
$$J = \sum_{i=1}^n(y_{si} - y_{mi})^T w_i(y_{si} - y_{mi})$$
	Kjer so:
	- $y_s$ - merjeni odziv sistema
	- $y_m$ - odziv modela
	- $w$ - utezna funkcija

- Funkcija prileganja FIT (blizu 1 pomeni dobro prileganje)
$$\begin{gather}FIT(y) = \frac{1}{1+e(y)}\\
e(y) = \frac{1}{n}\sum_{i=1}^n(y_{si} - y_{mi})^2
\end{gather}$$
- Theilov koeficient
$$TIC(y) = \frac{\sqrt{\sum_{i=1}^n(y_{si} - y_{mi})^2}}{\sqrt{\sum_{i=1}^ny_{si} ^2}+\sqrt{\sum_{i=1}^ny_{mi} ^2}}$$

# Optimizacija

Namen tega sklopa je:
- podati definicijo optimizacije
- opozoriti na situacije, kjer je optimizacija pomembna pri modeliranju
- predstaviti znacilne kriterijske funkcije, ki so hkrati lahko tudi merilo kakovosti modelov
- predstaviti nekaj znacilnih pristopov oz. optimizacijskih metod
- prikazati realizacijo optimizacijskih funkcij v Matlabu

## Optimizacija
__Kaj je optimizacija?__
_Postopek, s katerim skusamo izboljsati delovanje sistema_

- zahteva definicijo kvalitete obnasanja sistema oz. kriterij, saj le tako lahko razsodimo, ce je sprememba povzrocila izboljsanje ali poslabsanje sistema
- poteka lahko dokler je izboljsava sistema mozna
- pogosto uporabljamo [[#Kvantitativni kriteriji vrednotenja|integralske cenilke]]
- za dolocanje vrednosti paramterov uporabljamo optimizacijske metode
- optimizacijski algoritmi se izvajajo __iterativno__, dokler ni izpolnjen pogoj za konec optimizacije

__Kdaj optimizacija ni vec mogoca, oz. kdaj se konca?__
1. Ko smo nasli pravi optimum kriterijske funkcije, npr. ce sprememba med iteracijama pade pod definiran prag (v praksi tezko vemo, kdaj smo dosegli optimum)
2. Ko je dosezeni rezultat dovolj blizu zazelenemu
3. Ce postopek optimizacije preseze casovno omejitev trajanja izracuna

## Optimizacija za potrebe modeliranja
Potrebno je lociti 2 postopka za iskanje optimalnih modelov za pripadajoe sisteme:
1. Dolocanje primerne __strukture modela__
2. Dolocanje primernih __parametrov modela__

Določevanje strukture in parametrov modela je običajno v domeni _identifikacijskih metod,_
čeprav je do določene meje izvedljivo tudi z optimizacijskimi metodami.

Kadar pa spremembe omejimo le na spreminjanje parametrov ob v naprej določeni strukturi
modela, govorimo o _parametrski optimizaciji._

Parametrske optimizacije naceloma potekajo v 5 znacilnih korakih:
1.  določitev začetnih vrednosti parametrov
2. ovrednotenje kriterijske funkcije
3. testiranje pogojev ustavitve izračuna
4. določitev spremembe parametrov, tj. njihovih novih vrednosti
5. skok na 2. korak

__Definicijo kriterijske funkcije__ in pogojev ustavitve optimizacijskega izračuna določa načrtovalec sam glede na problem, ki ga rešuje, pogosto pa izbere tudi smiselne začetne vrednosti parametrov, saj lahko le-ti pogosto pomembno vplivajo na dobljen rezultat.

__Določanje ustrezne spremembe parametrov__ praviloma poteka skladno z določenimi algoritmiziranimi postopki, ki skušajo zagotoviti čim hitrejšo konvergenco k iskanemu optimalnemu rezultatu.

Optimizacijske metode se razlikujejo torej predvsem po tem, _kako poteka 4. korak_. V dolocenih primerih je lahko tudi 1. korak ze lahko del iskalnega postopka 

__Splosni optimizacijski algoritem:__

![[Pasted image 20241119130438.png]]

## Delitev optimizacijskih metod
1. Glede na omejenost prostora
	1. neomejene (parametri imajo lahko katerokoli vrednost)
	2. omejene (uposteva naravo sistema)
2. Glede na stevilo kriterijev
	1. Upostevanje enega kriterija
	2. Upostevanje vec kriterijev hkrati
3. Glede na vrajene algoritme
	1. Lokalne optimizacijske metode 
	2. Globalne optimizacijske metode 

__Lokalne optimizacijske metode lahko delimo na:__
1. Gradientne metode:
	- metode temeljijo na računanju kriterijske funkcije in tudi njenega gradienta, pri postopkih drugega reda pa še metrično matriko (v vsaki iteraciji).
	- _Prednosti:_ v blizini prvega minimuma relativno hitro konvergirajo
	- _Slabosti:_ Pogosto obticijo v lokalnem minumumu, dolocanje gradienta je lahko tezavno
1. Direktne metode
	- temeljijo na računanju kriterijske funkcije v različnih točkah parametrskega prostora.
	- _Prednosti:_ Mozna uporaba, ce gradient ne obstaja, preprostejse od gradientnih metod
	- _Slabosti:_ casovno potratnejse zaradi vecjega preiskovlnega prostora

Ko imamo opravka z omejeno optimizacijo, so postopki odvisni tudi od matematične narave kriterijske funkcije in omejitvenih funkcij. V splošnem tovrstne probleme prevedemo v t.i. probleme matematičnega programiranja (linearno, kvadratično, nelinearno programiranje), npr. Matlab: lsqr, lsqlin, lsqnonlin, evaluate, solve …

__Globalne optimizacijske metode:__
- Povod za njihov nastanek je iskati v poskusih _posnemanja narave_ pri njeni uspesnosti resevanja kompleksnih problemov:
	- Posnemanje evolucije
	- Posnemanje drugih naravnih pojavov, kot simulirano ohlajanje, optimizacija z rojem delcev, kolonijami mravelj...

## Optimizacija z genetskimi algoritmi
Posnemajo naravno evolucijo, njena znacilnost je, da vsaka populacija sestoji iz oseb z razlicnimi lastnostmi, vendar se dolgorocno obdrzijo le lastnosti, ki so boljse glede na dolocene kriterije

Postopek:

1. Definicija zacetne generacije oz. populacije
![[Pasted image 20241119134226.png]]
2. . Vrednotenje kvalitete posameznih osebkov populacije
3. Testiranje pogojev ustavitve izracuna
4. Tvorjenje nove generacije - __razmnozevanje__
5. Skok na 2. korak

- Iz starsevske populacije tvorimo generacijo potomcv, s posnemanjem reprodukcije pri zivih organizmih, torej ob upostevanju _uspesnosti starsev_, ob posnemanju krizanja in omogocanju mutacij
- Najveckrat ohranjamo nespremenjeno stevilo osebkov nove generacije
- Pricakovano stevilo osebkov, ki jih prispeva osebek i v novo generacijo je v tem primeru:
$$\frac{nf_i}{\sum_{i=1}^nf_i} = \frac{f_i}{f}$$
V nadaljevanju dolocimo stevilo novih potomcev glede na 2 moznosti
1. __Deterministicna selekcija__
	- Stevilo potomcev je doloceno glede na uspesnost, zaokrozimo izracun na celi del stevila in reproducitramo potomce glede na taksen izracun
	- Manjkajoce osebke dopolnimo iz generacije starsev, tako da najboljse iz generacije kloniramo in uvrstimo v novo generacijo
2. __Nakljucna selekcija__
	- Posamezni odseki predstavljajo osebke, sirina odseka je sorazmerna uspesnosti osebkov. Potomce izberemo z zadetki na tako utezenem prikazu. Slabost tega pristopa je, da lahko porazdelitev potomcev precej odstopa od uspesnosti starsev

Manjkajoce osebke naslednje generacije lahko dolocimo na 2 nacina:
1. __Krizanje:__ izmenjava genskega materiala med osebki
![[Pasted image 20241119135216.png]]
2. __Mutacija:__ nakljjucno spremeni vrednost znakov v nizu in tako omogoca nakljucno preiskovanje prostora starsev

Za optimizacijo z genetskimi algoritmi je znacilno:
- Pri vsaki optimizaciji je rezultat drugacen zaradi _nakljucnih dejavnikov_ izracuna (zacetna generacija je ponavadi nakljucna)
- Najboljsi rezultat se lahko izgubi, ce ne zagotovimo njegove ohranitve v naslednji generaciji
- Ni nujno, da najdemo pravi optimum, a obicajno pridemo v njegovo blizino
- Uspesni so tudi v primeru vecjega stevila optimiranih parametrov