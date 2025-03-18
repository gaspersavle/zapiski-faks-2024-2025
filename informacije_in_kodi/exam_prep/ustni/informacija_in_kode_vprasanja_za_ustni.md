## 1. Entropija

### Kaj je entropija?

Entropija je *merilo negotovosti ali neurejenosti* v sistemu. V teoriji informacij meri povprečno količino informacij, ki jo vsebuje vir sporočil. Matematično je entropija definirana kot:
$$H(X)=−\sum_i^np_i\log_d (p_i)$$​

kjer so $p_i$​ verjetnosti posameznih stanj sistema, $d$ pa osnova logaritma (običajno 2 za bite, $e$ za nate).

### Meje entropije

Entropija je vedno v intervalu $[0,K \cdot log_d n]$ kjer je $n$ število možnih stanj sistema.

- **Minimum (0)**: Sistem je popolnoma določen (ena verjetnost je 1, ostale 0).
    
- **Maksimum ($K \cdot log_d n$)**: Vse verjetnosti so enake $p_i = \frac{1}{n}$
    

### Kako bi razložil entropijo prijatelju?

Entropija je kot *merilo, koliko "presenečenja" lahko pričakujemo* od sistema. Če imamo sistem z enim samim možnim stanjem, je entropija 0, ker ni negotovosti. Če imamo *več enako verjetnih stanj, je entropija največja*, ker je največ negotovosti.

---

## 2. Informacija

### Kaj je informacija?

Informacija je količina, ki meri, *koliko negotovosti smo odpravili z opazovanjem nekega dogodka*. Če imamo naključno spremenljivko $X$, je informacija, ki jo pridobimo z opazovanjem $X$, enaka entropiji $H(X)$

### Vzajemna informacija

Vzajemna informacija $I(X;Y)$ meri, *koliko informacije ena naključna spremenljivka* (npr. $Y$) *daje o drugi* (npr. $X$). Matematično je definirana kot:$$I(X;Y)=H(X)−H(X∣Y)$$

kjer je $H(X∣Y)$ pogojna entropija $X$ ob poznavanju $Y$

### Mejne vrednosti vzajemne informacije

Vzajemna informacija je vedno v intervalu $[0,min⁡(H(X),H(Y))]$.

- **Minimum (0)**: $X$ in $Y$ sta neodvisni.
    
- **Maksimum**: $X$ in $Y$ sta popolnoma odvisni (npr. $X=Y$).
    
---
## 3. Diskretni viri informacije
### Kaj je diskreten vir informacije?
Diskreten vir informacije je *sistem, ki oddaja znake iz končne abecede* $A=\{x1,x2,…,xa\}$. Matematično ga opišemo kot *naključni proces z diskretnimi vrednostmi.*
### Stacionarni viri
Vir je **stacionaren**, če so *verjetnosti oddaje znakov neodvisne od časa*. To pomeni, da je verjetnost oddaje določenega niza znakov enaka ne glede na trenutek oddaje.
### Ergodični viri
Vir je **ergodičen**, če se *statistične lastnosti vira ne spreminjajo s časom* in če *lahko porazdelitev verjetnosti ocenimo iz enega samega dolgega niza znakov.*
#### Primer ergodicnega vira:
Primer ergodicnega vira je _met kovanca_, kjer je vsaka od 2 moznih vrednosti (slika/cifra) neodvisna od prejsnje in *ima stalno verjetnost*
- Vir je stacionaren, saj se _verjetnostna porazdelitev ne spreminja skozi cas_
- Vir je ergodicen, ker se dolgorocno povprecje vrednosti iz enega niza ujema s pricakovano vrednostjo cez vse mozne nize (_ne glede na izbiro strani_)
#### Primer ne-ergodicnega vira:
Primer ne-ergodicnega vira je _met prirejenega kovanca_, kjer ima ena stran visjo verjetnost, da pade, kot druga. Posamezni meti so _pogojno neodvisni, odvisno od izbire strani kovanca_
- Vir je ne-ergodicen, ker nam _dolgorocno povprecje metov v enem nizu_ __ne da prave pricakovane vrednosti__ cez vse mozne nize. Razlicni nizi imajo razlicne dolgorocne povprecne vrednosti, odvisno od izbire strani kovanca.
### Viri s spominom in brez spomina
- **Brez spomina**: Verjetnost oddaje znaka ni odvisna od prejšnjih znakov.
- **S spominom**: Verjetnost oddaje znaka je odvisna od prejšnjih znakov (npr. Markovovi viri).
### Markovov vir
Markovov vir je tip *diskretnega vira informacije*, kjer verjetnost oddaje znaka v določenem trenutku *ni odvisna od celotne pretekle zgodovine, temveč le od prejšnjega znaka*. Tak vir se modelira kot Markovov proces prvega reda.$$P(Xn​=xj​∣X1​=xk​,...,Xn−1​=xi​)=P(Xn​=xj​∣Xn−1​=xi​)$$
- Porazdelitev znakov v nizu *ni odvisna od trenutka oddaje*
- Dolg Markovov niz sledi določeni strukturi, kjer so *nekateri znaki in zaporedja znakov bolj verjetni kot drugi*.
- Markovovi viri se pogosto uporabljajo za modeliranje:
	- *jezikovnih procesov* (analiza besedil, generiranje besedil),
	- *genetskih sekvenc* (zaporedja DNK baznih parov),
	- *stiskanja podatkov* (modeliranje statistične odvisnosti simbolov v datotekah),
	- *kriptografije* (analiza šifriranih nizov),
	- *signalne obdelave* (modeliranje govora in glasbe).

---
## 4. Kodiranje vira informacije
### Kaj je kod vira informacije?
Kod vira informacije je *preslikava, ki znake iz abecede vira preslika v znake iz abecede koda*. Kod je **trenuten**, če *ga lahko dekodiramo sprotno* (brez čakanja na celotno sporočilo).
#### Primer trenutnega koda:
Primer trenutnega koda je lahko _huffmanov kod_, pri katerem noben znak ne predstavlja predpone za drugega. _Vsi enakomerni kodi so tudi trenutni_, neenakomerni kodi pa so lahko trenutni ali ne-trenutni. Huffmanov kod ni enakomeren, vendar je njegova trenutnost odvisna od izvedbe

| Znak | Kod __A__ | Kod __B__ |
| :--: | :-------: | :-------: |
|  A   |    _0_    |    _0_    |
|  B   |   1 _0_   |   _0_ 1   |
|  C   |    1 1    |    1 1    |
- V primeru _koda_ __B__, vidimo, da je kodna zamenjava znaka A, tudi predpona za kodno zamenjavo znaka B, torej kod _ni trenuten_, saj ob prejemu znaka 0 ne vemo, ali je to kodna zamenjava za znak A, ali le zacetek kodne zamenjave za znak B
- V primeru _koda_ __A__, pa vidimo, da nobena kodna zamenjava ne predstavlja predpone za nobeno drugo kodno zamenjavo, torej je _kod trenuten_, saj lahko vsak znak dekodiramo takoj ob prejemu
### Enakomerni in neenakomerni kodi

- **Enakomerni kodi**: Vse kodne zamenjave imajo enako dolžino (npr. ASCII).
- **Neenakomerni kodi**: Kodne zamenjave imajo različne dolžine (npr. Huffmanov kod).
### Optimalnost koda
Optimalen kod ima 
Optimalen kod je tisti, ki *minimizira povprečno dolžino kodnih zamenjav*. To pomeni, da znakom z večjo verjetnostjo pripišemo krajše kodne zamenjave.
### Kraft-McMillanova neenakost
Govori o pogoju, pod katerim lahko sestavimo enolične neenakomerne kode.
Kraft-McMillanova neenakost govori o *pogoju, pod katerim lahko sestavimo enolične neenakomerne kode*. Pove, da za neenakomerni kod z dolžinami kodnih zamenjav $n_1,n_2,…,n_a$ ,​ velja:$$\sum_{i=1}^a b^{-n_i} \leq 1$$
kjer je $b$ moč abecede koda (dolzina abecede). *Če ta neenakost velja, obstaja trenutni kod s temi dolžinami.*

### Gospodarno kodiranje
Gospodarno kodiranje je *postopek kodiranja, ki minimalizira povprečno dolžino kodnih zamenjav*, hkrati pa ohranja možnost enoličnega dekodiranja. Glavni cilj gospodarnega kodiranja je *učinkovita uporaba podatkovnega kanala* in zmanjšanje potrebne količine podatkov za prenos informacij.
Gospodarni kod mora izpolnjevati naslednje pogoje:
1. *Enolično dekodiranje* – vsak niz kodnih simbolov mora imeti natanko eno ustrezno zaporedje znakov iz abecede vira.
2. *Minimalna povprečna dolžina kodnih zamenjav* – cilj je doseči čim manjšo vrednost $n$.
3. *Uporaba neenakomernih kodov* – gospodarni kod ni nujno enakomeren (dolžine kodnih besed so različne glede na verjetnosti znakov).
---

## 5. Tajno kodiranje
### Kaj je kriptografski sistem?
Kriptografski sistem je sistem, ki omogoča tajno komunikacijo. Sestavljen je iz *množice odprtih sporočil* $M$, množice prikritih sporočil $C$ in množice ključev $K$
### Digitalni podpis
Digitalni podpis je matematična shema za preverjanje pristnosti digitalnih sporočil. Uporablja *asimetrično kriptografijo, kjer ima vsak uporabnik par ključev*: javni in zasebni.
- Digitalni podpis pogosto uporablja **RSA kriptografski algoritem**, postopek je sledec:
	1. Generiranje ključev:
		- Izberemo dve veliki praštevili $p$ in $q$.
		- Izračunamo $n=pq$ in Eulerjevo funkcijo $\phi(n) = (p-1)(q-1)$
		- Izberemo naključno število $e$ tako, da $gcd⁡(e,ϕ(n))=1$
		- Izračunamo$d$, kjer $e \cdot d \equiv 1 \mod \phi(n)$
		- **Javni ključ**: $(e,n)$
		- **Zasebni ključ**: $(d,n)$
	2. Podpisovanje
		- Izračunamo **zgoščeno vrednost**: $h = \text{hash}(M)$
		- Podpis ustvarimo kot: $S = h^d \mod n$
	3. Preverjanje
		- Prejemnik izračuna: $h' = \text{hash}(M)$
		- Dešifrira podpis: $h = S^e \mod n$
		- Če je $h = h'$, je podpis veljaven.
		
Za digitalne podpise se uporabljajo *kriptografske zgoščevalne funkcije*, kot so:
- *SHA-1* (prej pogosto uporabljen, danes ranljiv),
- *SHA-256* (najbolj uporabljan danes),
- *SHA-3* (novejši standard).
### Overjanje sporočil in uporabnikov
Ko prejemnik prejme sporočilo $M$ in digitalni podpis $S$, sledi naslednji postopek:
1. **Pošiljatelj** izračuna povzetek sporočila $P=SHA(M)$. (SHS je hash)
2. **Pošiljatelj** podpiše povzetek s svojim zasebnim ključem: $S=D_{RSA}(P,K_d)$.
3. **Prejemnik** preveri podpis z javnim ključem pošiljatelja: $P^{'}=E_{RSA}(S,K_e)$.
4. **Prejemnik** izračuna povzetek sporočila $P^"=SHA(M)$.
5. Če $P^{'}=P^"$, je sporočilo pristno.
---
## 6. Komunikacijski kanali
### Kaj je komunikacijski kanal?
Komunikacijski kanal je *sistem, ki omogoča prenos informacij od oddajnika do sprejemnika*. Kanali so lahko brez motenj, z motnjami ali neuporabni.
### Matrike kanalov
- **Brez motenj**: Vsak vhodni znak se preslika v natanko en izhodni znak.
	- Ima kvadratno matriko kanala $P_K$, ki ima v vsaki vrstici in vsakem stolpcu _le en element z vrednostjo 1_, vsi ostali elementi pa imajo vrednost 0 $$P_K = \begin{bmatrix}1 & 0 & 0\\ 0 &0 & 1 \\ 0 & 1 & 0\end{bmatrix}$$
	- Pogojna entropija kanala je 0.  $\rightarrow H(X|Y_i) = 0$
- **Neuporaben kanal**: Izhodni znaki so neodvisni od vhodnih
	- Kanal je neuporaben, ko vidimo, da za en prejet znak obstaja vec moznih vhodnih znakov z _enako verjetnostjo_, Torej v stolpcu imamo vse vrednosti enake $$P_K = \begin{bmatrix}0.9 & 0.1\\ 0.9 &0.1\end{bmatrix}$$
- **Simetričen kanal**: Verjetnosti prehajanja znakov so simetrične. _Vsak vhodni simbol ima enako verjetnost napacnega prenosa_.
	- Vrstice matrike knala so samo razlicne permutacije istih stevil, prav tako pa tudi stolpci (v vseh vrsticah in v vseh stoppcih nastopajo ista stevila, v ralicnih zaporedjih)$$P_K = \begin{bmatrix}0.4 & 0.1 & 0.5\\ 0.5 &0.4 & 0.1 \\ 0.1 & 0.5 & 0.4\end{bmatrix}$$
### Kapaciteta kanala
Kapaciteta kanala je *največja količina informacij, ki jo lahko prenesemo po kanalu v enoti časa*. Za **Gaussov kanal z omejeno pasovno širino** je kapaciteta:$$C=F\cdot log_2(1+\frac{S}{N})$$
kjer je $F$ pasovna širina, $S$ moč signala in $N$ moč šuma.

Iz formule je razvidno, da kapaciteta kanala:
- __Narasca__ _s frekvenco_
- __Narasca__ s SNR
	- Vecje razmerje $SNR$ pomeni, _vecjo magnitudo signala napram magnitudi suma_, torej cistejsi signal
### Funkcije odločanja
Funkcija odlocanja $g$ odloca, _kateri vhodni vektor_ $x_i$ _ustreza izhodnemu vektorju_ $y$ Cilj funkcij odločanja je _minimizirati napake pri dekodiranju_, pri cemer uporabljamo razlicne strategije odlocanja.

1. Funkcija odločanja z **najmanjšo verjetnostjo napake** (MAP - Maximum A Posteriori):
	- Zagotavlja najmanjšo povprečno verjetnost napake pri dekodiranju
	- Ce obstaja vec kandidatov z enako verjetnostjo se izbere naključni izmed teh z najmanjšo verjetnostjo
2. Funkcija odločanja z **najvecjo verjetnostjo** (ML - Maximum Likelihood)
	- Izbere vrednost $x$, ki maksimizira verjetnost prejetega $y$
	- Ne zagotavlja najmanjse napake, vendar je lazje izvedljiva, saj temelji samo na pogojnih verjetnostih
3. Idealna funkcija odločanja
	- *tista, ki minimizira verjetnost napake pri dekodiranju*. Za binarni simetrični kanal je to shema, ki *izbere vhodni vektor z najmanjšo Hammingovo razdaljo do sprejetega vektorja*.
4.  Minimum:
	- Izbira vektorja z najmanjšo Hammingovo razdaljo. (_uporabljeno pri binarnem kanalu_)
---
## 7. Varno kodiranje
### Bločni in konvolucijski kodi
- **Bločni kodi**: Vsaka kodna zamenjava je funkcija enega informacijskega bloka.
- **Konvolucijski kodi**: Kodne zamenjave so funkcije več informacijskih blokov
### Linearni bločni kodi
Linearni bločni kodi so kodi, kjer je *vsaka kodna zamenjava linearna kombinacija drugih kodnih zamenjav.* Uporabljajo matriko za preverjanje sodosti $H$, ki omogoča odkrivanje napak.
### Sindrom koda
Sindrom je *vektor, ki ga dobimo z množenjem sprejetega vektorja z matriko* $H$. Če je sindrom enak 0, je vektor pravilen. Če ni, lahko s sindromom ugotovimo, kje je napaka.
### Hammingova razdalja
Hammingova razdalja med dvema vektorjema je *število bitov, v katerih se razlikujeta*. Najmanjša razdalja koda $d_{min}$​ določa, koliko napak lahko kod popravi.$$\begin{gather}0010111001\\ \downarrow \\0\textcolor{red}1 \textcolor{normal}101\textcolor{red}0\textcolor{normal}1001\end{gather}$$
- Vidimo, da se vektorja znakov razlikujeta na 2 mestih, torej je _hammingova razdalja: 2_
---
## 9. Ciklični kodi
### Kaj so ciklični kodi?

Ciklični kodi so linearni kodi, kjer *vsak ciklični premik kodne zamenjave da drugo veljavno kodno zamenjavo*. Uporabljajo se za odkrivanje in popravljanje napak.

### Dekodiranje cikličnih kodov

Dekodiranje temelji na *računanju sindroma sprejetega vektorja*. Če je sindrom enak 0, je vektor pravilen. Če ni, lahko s sindromom ugotovimo, kje je napaka.
- Sindrom izračunamo kot ostanek pri deljenju prejetega niza z generatorjem ciklične kode $g(x)$: $$s(x)=r(x)mod  g(x)$$
- Če sindrom ni ničeln, uporabimo **iskalni algoritem** (npr. Berlekamp-Masseyjev algoritem) za določitev napak.
- Ko so napake odpravljene, prejemnik iz kodne besede izloči informacijske bite.

---

## 10. Prepletanje kodov
### Kaj je prepletanje?
Prepletanje je postopek, s katerim *razbijemo izbruh napak na krajše izbruhe*, ki jih lažje popravimo. To omogoča, da lahko kod popravi več zaporednih napak.

---
## 11. Shannonova izreka o varnem kodiranju
### Kaj pravi Shannonov izrek?
Shannonov izrek pravi, da če je hitrost koda $R$ manjša od kapacitete kanala $C$, obstaja kod, ki omogoča prenos informacij s poljubno majhno verjetnostjo napake. Če je $R>C$, takšnega koda ni.