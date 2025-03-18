# Uvod
## Definicija informacije
_Informacija je obvestilo prejemniku informacije, da se je nekaj zgodilo_

- Sporocilo za eno osebo vsebuje informacijo, a je za drugo osebo lahko ne vsebuje
- Zato je kolicina informacije, ki jo vsebuje neko sporocilo, vezana na osebo, ki sporocila sprejema
- Vec informacije vsebuje sporocilo z obvestilom o dogodku, ki naj prejemnika informacije bolj preseneti kot tisto, ki ga manj preseneti
- V plosnem velja, da so manj verjetnii dogodki bolj presenetljivi

## Definicije koda
- Da bi cloveku bila prejeta sporocila lahko povecala znanje, jih mora razumeti, da jih razume pa morajo biti sestavljena iz znakov, katerih smisel, pomeni in rabo pozna
- Informacije predstavimo s kodi

_Kod je dogovorjen znak, sestavljen iz enega ali vec znakov, s katerimi je predstavljen dogodek, ki sporoca_

- Ce bi za vsak dogodek v okolju imeli svoj znak, bi bilo stevilo znakv zelo veliko, zato navadno kode gradimo iz mnozice znakov

## Definicija kodiranja
_Kodiranje ali gradnja kodov je spreminjanje informacije v kode_

### Primer ISBN
Kod ISBN je kod za oznacevanje knjiznih izdaj. Zgradba koda je predpisana z vzocem:
$$ISBN A-B-C-x_{10},$$
Kjer so:
- __A__ kod jezika (drzave), sestavljen iz enega do 6 znakov
- __B__ kod izdajatelja, sestavljen iz enega do 6 znakov
- __C__ Kod knjige, in
- $x_{10}$ deseti, preverjalni znakk koda

## Definicija komunikacijskega sistema
- Pojem informacije je nelocljivo povezan s pojmom komunikacije
- Brez momunikacije ni informacije
- Informacija ni nekaj, kar obstaja le v komunikaciji med ljudmi, obstaja tudi v komunikaciji med ljudmi in stroji, ter med stroji in stroji
- Subjekti komunikacije so torej ljudje in stroji, so __sistemi__
- Abstraktno sisteme opisujemo s stanji, v katerih se lahko nahajajo, stanja pa z mnozicami kolicin, ki jih lahko izmerimo
- Mnozico kolicin, ki jo lahko merimo, navadno omejimo na deni vidik obravnave sistemov
- Vecina sistemov v naravi je hkrati __dinamicna, nakljucna in odprta__
- S casom namrec prehajajo iz enega stanja v drugo stanje na nakljucen, ne vnaprej predvidljiv nacin
- Nanje lahko vpliva okolje in obratno, oni lahko vplivajo na okolje
- Sporazumevanje poteka v sistemu, ki ga sestavljajo trije odprti, dinamicni in nakljucni podsistemi, ki jih oznacimo z __A, B in C__
	- __A__ pri prehodu iz enega stanja v druo stanje sporoci svoje novo stanje sistemu __C__
	- Sporocilo prinasa sistemu __C__ doloceno informacijo: manjso, ce je novo stanje sistema __A__ stanje, v katerem se navadno nahaja, oziroma vecjo, ce je novo stanje sistema __A__ stanje, v katerem se le malokdaj nahaja
	- Sistemu __A__ pravimo _posiljatelj_, sistemu __C__ pa _prejemnik informacije_
	- Sporocila se iz vira do prejemnika premikajo skozi sistem __B__, ki mu pravimo _kanal_


### Vprasanja
- Kaj je informacija?
- Kaj je kod?
- Kaj je sistem?
- Kaj je komunikacijski sistem?
- Opisi podsisteme komunikacijskega sistema


# Entropija
## Uvod
Vzemimo dinamicen, diskreten, nakljucen sistem, ki se nahaja v enem izmed n moznih stanj sistema

Stanja oznacujemo z:
$$x_1, x_2, \cdots, x_n$$
Verjetnosti, da se v dolocenem trenutku sistem nahaja v teh stanjih pa:
$$p_1, p_2, \cdots, p_n$$
Za stevila $p_i$ velja torej:
$$p_i \geq 0 \quad in \quad \sum_{i=1}^n p_i = 1$$
Ker sistem prehaja iz enega v druo stanje na nakljucen nacin, predstavlja napoved prihodnega stanja sistema naloga, katere tezanvostna stopnja je odvisna od:
- Stevila moznih stanj sistema
- Od verjetnosti posameznega stanja
## Mera nedolocenosti sistema
Za zunanjega opazovalca je vsak sistem bolj ali manj _nedolocen_

Bolj nedolocen je tisti nakljucni sistem, za katerega je tezavnostna stopnja resitve naloge napovedi stanja veja, manj pa tisti, za katerega je tezavnostna stopnja naloge napovedi manjsa

Zato zelimo za dinamicen, diskreten nakljucen sistem s porazdelitvijo vrednosti $p_1, p_2, \cdots, p_n$, kjer je n naravno stevilo, definirati __mero nedolocenosti sistema v dolocenem trenutku__

### Lastnosti mere nedolocenosti sistema
Mero bomo oznacevali s $H(p_1, \cdots, p_n)$, morajo veljati naslednje postavke:
- $H(p_1, \cdots, p_n) \geq 0$ in je 0 le tedaj, ko je nek $p_i = 1$. _Nedolocenostnje nenegativna kolicina, ki je enaka 0 v staticnih nenakljucnih sistemih_
- $H(p_1, \cdots, p_n)$ je najvecja za $p_1 = p_2 = \cdots = p_n = 1/n$. _Nedolocenost sistema je najvecja, ce so vsa stanja sistema enako verjetna_
- $H(1/n, \cdots, 1/n)$ , ce je $n > m$. _Sistem z vec enako verjetnimi stanji je bolj nedolocen, kot sistem z manj enako verjetnimi stanji_
- $( H(p_1, \dots, p_n)$ ni odvisna od permutacij stevil $p_1, \cdots, p_n$
- $H(p_1, \dots, p_n, 0) = H(p_1, \dots, p_n).$ _Z dodatnim stanjem, ki ima verjetnost enako niv, se nedolocenost sistema ne spremeni_
- $( H(p_1, \dots, p_n)$ Je zvezna funkcija. _Majhna sprememba verjetnosti stanj ne more znatno spremeniti nedolocenosti sistema_
- Za $m, n \in \mathbb{N}$ Velja:
$$
H\left(\frac{1}{mn}, \dots, \frac{1}{mn}\right) = H\left(\frac{1}{m}, \dots, \frac{1}{m}\right) + H\left(\frac{1}{n}, \dots, \frac{1}{n}\right).
$$
_Ce imamo dva neodvisna sistema, enega z m in drugega z n enako verjetnimi stanji, je skupna nedoloenost obeh sistemov enaka vsoti nedolocenosti posameznih sistemov_

- Za $m, n \in \mathbb{N}$ sta stevili $p = p_i + \cdots + p_m$ in $r = r_1 + \cdots + r_n$ kjer so vsi $p_i \geq 0$ in $r_j \geq 0$ nenegativni. Ce sta p in r pozitivna ter $p + r = 1$, velja
$$h(p_1, \cdots, p_m, r_1, \cdots, r_n) = H(p,r) + pH(\frac{p_1}{p}, \cdots, \frac{p_m}{p} + rH(\frac{r_1}{r}, \cdots, \frac{r_n}{r})$$
_Ce imamo sistem, sestavljen iz stanj, ki jih lahko razvrstimo v dva razreda, enega z m stanii , drugega z n stanji, je nedolocenost sistema enaka vsoti nedolocenosti, da je stanja oz enega izmed obeh razredov in obtezenih vsot nedolocenosti stanj v enem in drugem razredu_

Iz navedenih postavk lahko dokazemo:
_naj bo $H(p_1, \cdots, p_n)$ funkvcija, ki je definirana za vsak $n \in \mathbb{N} (n \geq 2)$ in za vsako n-terico $(p_1, \cdots, p_n)$ kjer je $p_i \geq 0$ in $\sum_{i=1}^n p_i = 1$ ce zadosca funkcija H, zgoraj zastavljenim postavkam velja:_
$$H(p_1, \cdots, p_n) = -K \sum^n_{i = 1}log_dp_i$$
Kjer sta K>0 in poljubna konstanta in d>1 osnova logaritma

Funkcija je mera nedolocenosti dinamicnega, nakljucnega in diskretnega sistema, imeujemo jo _entropija_ in jo krajse oznacujemo s $H(D_n)$, kjer je $D_n = (p_1, \cdots, p_n) \in \Delta_n$ dana porazdelitev verjetnosti, $\Delta_n$ pa mnozica vseh $D_n$

Ce vzamemo da je K = 1 in d = 2, je po definiciji enota entropije _bit_
Za teoreticno obravnavo je najprimernejsa izbira K=1 in d=e. V tem primeru je enota entropije nat ( v literaturi tudi nit)

Ce smo izracunali entropijo sistema v natih, jo dobimo v bitih z mnozenjem s konstanto $\frac{1}{ln2} ~= 1,44$, obratno pa s konstanto $ln2 ~= 0.69$

## Nakljucne spremenljivke
Nakljucna spremenljivka je spremenljivka, katere vrednost je odvisna od nakljucja, ce jo zelimo poznati, moramo poznati njeno zalogo vrednosti in njeno _porazdelitveno funkcijo_

Ce oznacimo nakljucno spremenljivko z X in vzamemo, da crpa vrednosti iz mnozice realnih stevil, lahko zpaisemo porazdelitveno funkcijo kot kumulativno funkcijo
$$F(x) = P(X,x)$$
Kjer je X realno stevilo iz njene zaloge vrednosti

## Diskretne nakljucne spremenljivke
Vzemimo, da je porazdelitvena funkcija diskretna, to je da narasca v skokih. V tem primeru jo lahko opisemo s tockami nezveznosti $x_i$ in z velikostmi skokov v teh tockah 

$$p_i = P(X = x_i) (i = 1, 2, \cdots)$$
Tako zapisani porazdelitveni funkciji pravimo _porazdelitev verjetnosti_, nakljucni spremenljivki, ki jo ima pa _diskretna_

## Entropija diskretnega nakljucnega sistema
Opis dinamicnega, diskretnega, nakljucnega sistema z nakljucno diskretno spremenljivko velja le za dolocen trenutek dogajanje v sistemu, zanimiv pa je predvsem zato, ker omogoca obravnavo entropije sistema loceno od njenega fizikalnega ozadja

Entropija je ena izmed tistih stevilskih karakteristik nakljucne diskretne spremenljivke, ki opisuje njene znacilnosit

Entropija nakljucne diskretne spremenljivke, naj bo X, ki crpa vrednosti iz koncne zaloge vrednosti $\mathbb{Z}(X) = \{x_1, x_2, \cdots, x_n\}$ v skladu s porazdelitvijo verjetnosti $(p_1, p_2, \cdots, p_n)$, kjer je $p_i \geq 0$ in $\sum_{i=1}^n p_i=1$ je:

$$H(X) = -K\sum_{i=1}^n p_i log_dp_i$$
Kjer sta K>0 poljubna konstanta in d>1 osnova logaritma

Entropija H(X) nakljucne spremenljivke X je mera nedolocenosti dogodka, da zavzame nakljucna spremenljivka doloceno vrednost iz svoje zaloge vrednosti

Vidimo, da je odvisna le od $P_X$ ter da lahko pisemo $P_X = D_n$ in $H(X) = H(p_1, \cdots, p_n) = H(D_n)$

### Lastnosti funkcije H(X)

#TODO do entropije para diskretnih nakljucnih spremenlj


## Entropija para diskretnih nakljucnih spremenljivk

Ce je par diskretnih nakljucnih spremenljivk, nakljucni vektor $(X, Y)$. Par $(X, Y)$ crpa vrednosti iz zaloge vrednosti$$\mathcal{Z}((X, Y)) = \{(x_i, y_j)\}: i=1,2,\cdots, m ;\quad j=1,2,\cdots, n$$
V skladu z dvorazsezno porazdelitvijo verjetnosti
$$p_{ijs} = P(X =x_i, Y = y_j)\geq0:i - 1, \cdots, m\quad j=1, \cdots, n; \sum_{i=1}^m \sum_{j=1}^n p_{ij}=1)$$
Mnozico vseh moznih dvorazseznih porazdelitev verjetnosti nad mnozico $\mathcal{Z}((X,Y))$ oznacimo z $\Delta_{mn}$, $D_{mn}$ je poljubna dvorazsezna porazdelitev verjetnosti iz $\Delta_{mn}$:
$$$$
#TODO dopolni
## Entropija _n_ diskretnih nakljucnih spremenljivk
__Definicija:__
Entropija poljubne koncne mnozice diskretnih nakljucnih spremenljivk definiramo kot:
$$H(X_1, X_2, \cdots, X_n)=-K\sum_{i_1}\cdots\sum_{i_n}p_{i_1}\cdots i_n log_d p_{i_1} \cdots i_n$$
Kjer so K > 0 poljubna konstanta, d>1 osnova logaritma in
$$p_{i_1...i_n} = P(X_1 = x_{i_1}, X_2 = x_{i_2}, \cdots, X_n = x_{i_n}$$
n-razsezna porazdelitev verjetnosti


__Zveze med entropijami::__
Med entropijami posameznih spremenljivk, pogojnimi entropijami in vezano entropijo lahko vspostavimo naslednji zvezi:

$$H(X_1, \dots, X_n) = H(X_1) + H(X_2 \mid X_1) + H(X_3 \mid X_2, X_1) + \cdots + H(X_n \mid X_{n-1}, \cdots, X_1) = \sum_{i=1}^nH(X_i|X_{i-1}, \cdots, X_1) $$
In
$$H(X_1, \dots, X_n) \leq H(X_1) + \dots + H(X_n) = \sum_{i=1}^{n} H(X_i)$$
Kjer velja znak enakosti _le, ce so $X_i$ neodvisne nakljucne spremenljivke_

#TODO dopolni

# Informacija
Informacija lahko nastane le med sporazumevanjem, le-to pa poteka v sistemu, ki ga sestavljajo vir infromacije, kanal, ki te info prevaja in prejemnik informacije

Razmere v komunikacijskem sistemu v dolocenem casovnem trenutku lahko opisemo s tremi nakljucnimi spremenljivkami

![[Pasted image 20241021104826.png]]

## Lastna informacija diskretnih spremenljivk

Vzemimo, da je spremenljiuvka X nakljucna diskretna spremenljivka
$$\mathcal{Z}(X) = \{x_1, x_2, \cdots, x_n\}$$
ter pokazatelj verjetnosti
$$p_i = P(X=x_1)\geq0, \sum_ip_i = 1$$
Ce zalogo vrednosti nakljucne spremenljivke X razumemo kot zalogo znakov, iz katere vir v trenutku oddaje crpa znake, lahko recejo, da je znak $x_i$, ki ga vir odda z verjetnostjo $p_i$, nosi informacijo $I(x_1)$

Od funkcije $x_i \rightarrow I(x_i), x_i \in \mathcal{Z}(X)$ zahtevamo, da ima naslednje lastnosti:
1. _Informacija, ki jo nosi znak $x_i$, je funkcija njegove verjetnosti
$$I(x_i) = U(p_i).$$
2. _$p \mapsto U(p)$ je zvezna funkcija na intervalu  $(0, 1]$._
3. _Bolj verjetni znaki nosijo manj infoirmacije_
$$p \mapsto U(p) \text{je strogo padajoca funkcija na intervalu} (0, 1]$$
4. _Informacija ki jo nosita dva statisticno neodvisna znaka, je enaka vsoti informacije, ki jo nosita posamezna znaka_
$$
U(p' \cdot p'') = U(p') + U(p''), \text{za vsak } p' \text{ in } p'' \in (0, 1]$$

Ce izhajamo iz teh postavk lahko dokazemo spodnji izrek:

>[!note]
>Funkcija $p \mapsto U(p), p \in (0,1]$, ki zadosca zgornjim postavkam, je oblike:
>$$U(p) = -K log_d p$$,
>Kjer sta K>0 poljubna konstanta in s>1 osnova logaritma


