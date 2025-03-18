# Histogrami
Vrednosti pikslov tretiramo, kot realizacijo naljucnih spremenljivk, ki jo definirata:
- Razpon [0:255]
- In verjetnostne porazdelitve $P(I) = P(i=i_k) = (p1, p2, \cdots, p_n), \sum_{k = 1}^N p_k=1$

Za pridobitev histograma prestejemo stevilo pikslov posamezne vrednosti in narisemo stevilo ponovitev iste vrednosti. Ce histogram normaliziramo, da je vsota enaka 1, je histogram _aproksimacija verjetnostnih porazdelitev_

Na bazi sivinskega hitograma lahko marsikaj povemo o sliki:
- dinamicni razpon - ali je dobro pokrit ali ne
- svetlost slike - presvetla, pretemna, primerno svetla, ...
- kontrast - visok, nizek
- katera sivinska vrednost dominira na sliki
![[Pasted image 20241120083332.png]]

## Barvni histogram
Za razliko od sivinskega histograma, ki ima enodimenzionalno informacijo, ima barvi histogram 3D informacijo

![[Pasted image 20241120084239.png]]

Zaradi tezav s prikazom 3D histograma na 2D zaslonu pogosto uporabljamo 3x 1D histograme, za vsako komponento posebej

## 3D histogrami in binning
V pravi sliki imamo 8 bitov informacije na barvni kanal, 3D barvni histogram je torej 256x256x256 nabor. Kar nanese cca 16MB. 
- Iz zgoraj napisanega je razvidno, da so 3D histogrami veliki in povecinoma prazni, saj 255 svetlostnih vrednosti "raztegnemo" 16M vrednosti
- Zato naredimo t.i. binning vrednosti pikslov

Pri binning vzamemo nabor npr. 16 vrednosti iz prekvantiziranega nabora in jih umestimo v en bin.

| vrednost | bin      |
| -------- | -------- |
| 0-15     | 0        |
| 16-31    | 1        |
| 32-47    | 2        |
| 46-63    | 3        |
| $\cdots$ | $\vdots$ |

## Uporaba histogramov
- Korekcija svetlosti in kontrasta
- Upragovljanje (binarizacija)
- Izenacevanje histograma:
	- za sliko z nek osivinsko distribucijo, napravimo redistribucijo, da je razporeditev vrednosti _uniformna_
	- Zamisel za tem je, da __bi morele pogosteje uporabljene vrednosti imeti vecji razpon__
- Specificiranje histograma:
	- ko zacnemo z neko arbitrarno sliko, ustvarimo novo sliko, ki ima tak histogram, kot ga zelimo
- Histogrami so lahko uporabljeni tudi za opisovanje slik


### Izenacevanje histograma
- Iscemo transformacijo slike, ki bo ustvarila raven histogram
	1. Izracunamo histogram z 256 vrednostmi
	2. Izracunamo _kumulativni histogram_ (vsaka naslednja vrednost v histogramu je enaka vsoti vrednosti pred njo)
	3. Normaliziramo kumulatini histogram $h_nc = h_c/max(h_c)$
	4. Pomnozimo normalizirani kumulativni histogram z maksimalno vrednostjo originalnega histograma, npr. $255 \mapsto h_{mnc}$
	5. $h_{mnc}$ uporabimo kot lookup tabelo
Rezultat izenacevanja je neuniformiran histogram, kumulativni histogram pa je skoraj premica. __Efektivno smo povecali kontrast na sliki__ (za clovesko oko bolj prijazna slika)

### Upragovljanje
Z uporagovljanjem naceloma locimo objekte od ozadja, z binarizirano sliko je procesiranje enostavnejse, se posebej:
- Stetje objektov
- Sledenje konturam
- Dolocanje topologije
- Dolocanje dimenzij, povrsine, orientacije, ...
- Analiza oblike

Z uporabo histograma lahko najdemo optimalen prag, kjer imamo maksimalno kolicino informacije, prag postavimo:
- Med 2 najvecja vrhova
- Sredi najsirse doline

# Lokalne operacije
Upravljajo z majhno regijo sosednjih pikslov (3x3, 5x5,...)
Tipicno uporabljene za:
- Zmanjsanje hrupa
- Gaussov hrup
- Detekcijo robov
- Detekcijo kotov

## Konvolucija (linearno filtriranje)
- Diskretna 2D konvolucija:
$$I_{out}(i,j) = \sum_k\sum_l h(k,l)\cdot I_m(i-k, j-l)$$
-  kjer je h(k.l) konvolucijska maska (kernel)
- Obicajno je $h$ simetricen ali antisimetricen
![[Pasted image 20241120095631.png]]
![[Pasted image 20241120095649.png]]
![[Pasted image 20241120095727.png]]
### Primer rezultata konvolucije
![[Pasted image 20241120095820.png]]

- Konvolucijski filtri se obnasajo kot low-pass filtri, ki gladijo slike
	- Uporabljajo se za redukcijo visokofrekvencnega suma
	- Poleg suma, filtrarajo tudi uporabno informacijo
- Neprijeten stranski ucinek skatlastih filtrov je __ringing__

Ringing efekt povzroci oster rob filtra, ki ustvari oscilacije okoli robov na sliki, dosti boljsi efekt dobimo, ce uporabljamo filter z utezenim povprecjem, npr.

![[Pasted image 20241120101116.png]]

## Gaussov filter
$$G_\sigma(x,y) = \frac{1}{2\pi\sigma^2}e^{\frac{(x^2+y^2)}{2\sigma^2}}$$
![[Pasted image 20241120103136.png]]
Zgoraj desno je zapisan 5x5 gaussov filter, z vrednostjo normalizacijskega faktorja  $\sigma = 1$
- V principu se gaussov filter razteza od $-\infty$ do $\infty$ in jih sesteje v 1
- Zaradi neskoncnega razpona in diskretizacije, moramo normalizirati diskretne koeficiente tako, da se sestejejo v 1
- Gaussov filter se tudi onasa kot nizkoprepustni filter, za razliko od [[#Konvolucija (linearno filtriranje)|konvolucije]] nima pojava ringinga
![[Pasted image 20241120104705.png]]
- Za izbrano vrednost $\sigma$ moramo uporabljati velikost filtra, ki je vsaj $3\cdot \sigma$, sicer bo rob strmo odrezan, zaradi cesar pride do ringinga

Gaussov filter __je separabilen__, kar pomeni, da j elocljiv v 2 dimenziji, kar nam omogoci, da filtriranje opravljamo, kot 2 loceni operaciji 1D konvolucije:
- Vrsticna konvolucija
- Stolpicna konvolucija
1D konvolucija je racunsko manj zahtevna od 2D verzije

## Ne-ostro maskiranje
- T.I. ostrenje, od originalne slike odsteje meglenje
$$g(x,y) = f(x,y) - f_g(x,y)$$
![[Pasted image 20241120105947.png]]

__Primer:__
![[Pasted image 20241120110024.png]]

## Mediansko filtriranje

