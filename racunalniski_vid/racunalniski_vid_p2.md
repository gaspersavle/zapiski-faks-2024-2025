- Digitalne slike sestojijo iz nabora slikovnih elementov - __pikslov__
$$\begin{gather}
u = \frac{x}{\lambda_u} = \frac{f}{\lambda_u}\cdot \frac{X}{Z} = f_u \frac{X}{Z} = \frac{f_u}{Z}X = m_uX \\

u = \frac{y}{\lambda_v} = \frac{f}{\lambda_v}\cdot \frac{Y}{Z} = f_v \frac{Y}{Z} = \frac{f_v}{Z}Y = m_uY
\end{gather}$$
- Polozaj (X, Y, Z) tocke P je podan v koordinatnem sistemu kamere
	- Koordinatni sistem kamere ni znan ali direktno dostopen, saj sestoji iz koordinatnega sistema senzorja in lece
![[Pasted image 20241011132348.png]]
- P definiramo v globalnem koordinatnem sistemu
	- Globalne koordinate so definirane s stenami, objekti, roboti...
- Iz 3D v 2D mapiramo s:
	- Translacijo
	- Rotacijo
	- Projekcijo
# Parametri modela kamere
- Locimo
	- Zunanje (ekstrinzicne)
		- Polozaj
		- Orientacija
		- Definirano glede na globalni koordinatni sistem
	- Notranje (intrinzicne)
		- Povezujejo koordinate kamere s koordinatami slikovnega senzorja
		- Odvisne od celotnega sistema kamere, torej kamere same in lece
- Kolektivno imamo 11 parametrov:
	- Translacijo (3)
	- Rotacijo (3)
	- Goriscno razdaljo (1)
	- Opticni center (2)
	- Velikost piksla (2)

Do sedaj smo se ukvarjali le z linearnim modelom kamere, za model nelinearne kamere moramo implementirati se:
- Distorzijske parametre
- Obicajno 1-5 parametrov, odvisno od modela
## Kako pridobimo parametre kamere
- Kalibracija
	- Posnamemo prizor v realnem svetu z znanimi koordinatami
	- Imamo sliko tarce in tarco z znanimi koordinatami v globalnem koordinatnem sistemu

### Direktni linearni transform (DLT)
- Abdel-Aziz & Carara, 1971
- V principu nas zanima mapiranje:
$$T: R^3 \rightarrow R_2, P \rightarrow p$$
#TODO 
Enacba:
$$^BT_A$$
Nakazuje tranformacijo iz koordinatnega sistema A v koordinatni sistem B

Transformacije mnozimo z desne proti levi, torej:
$$\begin{gather}
^CP = ^CT_A(^AT_W\cdot ^WP)\\
\vdots\\
^CT_W = ^CT_A \cdot ^AT_W
\end{gather}$$
## Mapiranje ravnine na ravnino
$$
\mathbf{w}\begin{bmatrix}
u \\ v \\ w \\ 1
\end{bmatrix}
=
\mathbf{K}
\begin{bmatrix}
r_{11} & r_{12} & r_{13} & t_x \\
r_{21} & r_{22} & r_{23} & t_y \\
r_{31} & r_{32} & r_{33} & t_z
\end{bmatrix}
\begin{bmatrix}
X \\ Y \\ 0 \\ 1
\end{bmatrix}

\quad \quad \quad \mathbf{w}\begin{bmatrix}
u \\ v \\ w \\ 1
\end{bmatrix}
=
\mathbf{K}
\begin{bmatrix}
\mathbf{r_1} & \mathbf{r_2} & \mathbf{t}
\end{bmatrix}
\begin{bmatrix}
X \\ Y \\ 1
\end{bmatrix}
$$
Matrika $\mathbf{H}$ je projekcijska transformacija, je matrika dimenzij 3x3, invertibilna z 8 prostostnimi stopnjami

$$\begin{gather}\mathbf{H}_{3x3} = \mathbf{K[r_1, r_2, t]}\\
w\mathbf{u} = \mathbf{Hp}\end{gather}$$
Vsak par tock prispeva 2 enacbi, torej so za resitev matrike $\mathbf{H}$ zadostne 4 tocke

# Distorzija lece

## Camera obscura
Pri kameri obscuri velja:
- Zarki imajo ravno pot
- Ni distorzije
- Neprakticno, pri ISO 200 bi bil cas zalsonke 1-3 sekunde na soncu, _problem resujemo z vecjimi lecami_
![[Pasted image 20241018134142.png]]

## Opticni sistem z leco
Pri opticnem sistemu z leco velja:
- Zarki so preusmerjeni pri potovanju skozi leco
- Zarki so fokusirani, kar rezultira v svetlejsi sliki
- Obstajajo imperfekcije 
![[Pasted image 20241018134356.png]]

## Sistem z leco v praksi
Za prakticni sistem z leco/objektivom velja:
- Za doseganje boljsih lastnosti uporabimo vec opticnih elementov
- Eksaktna teoreticna analiza je zelo tezavna ali nemogoca zaradi skrivnosti proizvajalcev
![[Pasted image 20241018134555.png]]

## Aberacije lece
Aberacije degradirajo kvaliteto slike, nekatere vplivajo tudi na geometrijo zaznane slike
- Astigmatizem
- Koma
- Zvitost polja
- Barvne aberacije

Degradacija kvalitete je vidna, proizvajalci se trudijo minimizirati efekt aberacij

## Distorzija lece
- Tipi distorzije:
	- Radialna
	- Tangencialna
- Distorzija vpliva na geometrijo fotografije
- Prisotne, vendar nevidne za potrosnike
- Posledicno: linearni model kamere v praksi ne zadostuje

### Tangencialna distorzija
- Povzrocuje jo neporavnanost elementov v opticnem sistemu kamere
- Tocke na sliki so premaknjene v _tangencialni smeri_
![[Pasted image 20241018135039.png]]
- Redko kdo lahko opazi tangencialno distorzijo

### Radialna distorzija
- Tocke na sliki so premaknjene v radialni smeri, poznamo 2 tipa:
	- Blazina (pincushion)
	- Sod (barrel)
![[Pasted image 20241018135639.png]]
1. Tip _blazinica_:
	- Redko viden, neociten
	- Ponavadi ga povzroca prekompenzacija za _sodcasto distrozijo_
2. Tip _sod:_
	- Pogost pri sirokokotnih lecah

![[Pasted image 20241018135956.png]]

__Merjenje radialne distorzije:__

![[Pasted image 20241018140043.png]]

Zmeda pri obravnavi radialne distorzije:
- V _fotogrametriji_:
	- Izredno majhne distorzije (100 mikronov na r=100mm)
	- Kompleksna polinomska oblika distorzijske funkcije
	- Tezko zaznamo se na slikah v rangu megapikslov
-  V _kalibraciji kamer:_
	- Znatna distorzija je v rangu 3-4%
	- Za korekcijo distorzije uporabljamo polinomske metode aproksimacije
- V _racunalniskem vidu:_
	- Za veliko distrozijo se smatra distorzija v rango 30%
	- Distrozija tipa _sod_ je skoraj vedno naslovljena in popravljena
	- Poskusa se najti alternativne nacine za aproksimacijo distorzije tipa _sod_

Ozadje obravnave radialne distrozije:
- V opticnam inzeniringu uporabljamo kompleksne formule tudi za dizajn enostavnih lec
- Dejanska formula lece ni razkrita koncnemu uporabniku
- Vecina objektivov na trgu je vecelementnih
- Dizajn objektiva jemlje v postev kompromis med svetlostjo, uniformnostjo, vidnim kotom, distrozijo...

Objektivi z nizko distorzijo na podrocju fotogrametrije:
- Radialna distrozija v se pojavi vecinoa zaradi imperfektne kompenzacije

Na podrocju strojnega vida se uporabljajo nizkokakovostne lece, ki niso bile namenjene za merjenje, ki jih kalibriramo in s tem kompenziramo za distrozijo

![[Pasted image 20241018142159.png]]

#### Model radialne distorzije
- Generalno iscemo nelinearno funkcijo, v obliki
$$r = f(r_i) \quad or \quad r-r_i = f(r_i)$$
Ta enacba opisuje transformacijo radija $r_i$ v $r$

![[Pasted image 20241018142357.png]]

- Polinomska aproksimacija:
$$\Delta r = f(r_i) = k_0 + k_1r_l+k_2r_l^2+k_3R_l^3+\cdots+k_nr_l^n$$
	- Podedovana iz fotogrametricne industrije, kjer je distrozija vecinoma nepredvidljive narave
	- Obstajajo alternativne formule
- __Prednosti:__
	- Generalni model, ki ne predpostavlja tipa distorzije
- __Slabosti:__
	- Z veliko distrozijo je hitro potrebnih veliko koeficientov
	- Inverz polinoske aproksimacije ni izracunljiv
- Reduntanten za distprzijo cistega tipa _sod_
	- Koeficienti so uporabljeni za boljse monotono ujemanje narascujoce rampe $f(r_l)$
	- Pridobivanje parametrov je optimizacijski proces, ki je lahko nestabilen in pocasen
- Iz teh razlogov so se ljudje potrudili narediti konkurencne/alternativne modele distrozije
	- Za modeliranje specficnega tipa distorzije z manj koeficienti, kot v polinoskem modelu
	- Za  zagotavljanje analiticno izracunljivega inverza
	- Za zagotavljanje parametrov modela, povezanih s fizicno izmerljivimi lastnosti lec:
		- Vidni kot
		- Goriscna razdalja
- Polinomski model je sevedno najnaprednejsa metoda
	- Vcasih nezadosten
	- Optimizacije ne nujno konvergira
	- Za izracun inverza potrebujemo majhno stevilo parametrov
	- Vzasih preferiramo enostavnejsi model za ceno nizje tocnosti

#### Alternativni modeli
#TODO intro
1. Fish eye transform (FET)
$$r = s \dot log(1+\lambda r_i)$$
2. Field of view model (FOV)
$$r = \frac{1}{\omega}\arctan(2r_i\tan \frac{\omega}{2})$$
3. Nasa izpeljava alternativnega modela
	- Bazirana na lastnostih distortitrane slike (analogija na nagnjeno kamero)

![[Pasted image 20241018144451.png]]

__Izpeljava:__

![[Pasted image 20241018144516.png]]

__Uporabljeni model lece:__

![[Pasted image 20241018144539.png]]

| Projekcija    | Zapis                                         |
| ------------- | --------------------------------------------- |
| perspektivna  | $$r(\alpha) = f \cdot tan(\alpha)$$           |
| stereografska | $$r(\alpha) = f \cdot tan(\frac{\alpha}{2})$$ |
| ekvidistancna | $$r(\alpha) = f \cdot \alpha$$                |
| ekvi-kotna    | $$r(\alpha) = f \cdot sin(\frac{\alpha}{2})$$ |
| sinusna       | $$r(\alpha) = f \cdot sin(\alpha)$$           |

- Funkcija radialne distorzije bazirana na radialni funkciji perspektivne projekcije
$$
r' = f \cdot \ln \left( \frac{r'_l}{f} + \sqrt{1 + \frac{r'^2_l}{f^2}} \right) = f \cdot \operatorname{arcsinh} \left( \frac{r'_l}{f} \right)
$$
- Inverz:
$$r'_l = f \cdot sinh(\frac{r'}{f})$$
- _Edini parameter je goriscna razdalja $\mathbf{f}$_, ki je ze parameter linearne kalibracije
