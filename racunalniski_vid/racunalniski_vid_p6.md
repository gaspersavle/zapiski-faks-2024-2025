# Zaznavanje robov
## Kaj je rob?
- robna tocka j etocka, kjer se spremeni svetlost na sliki
- Robne tocke niso linije ali konture, za to jih moramo povezati
Ker je rob lokacija, s hitro spremembo v svetlosti, lahko za detekcijo uporabljamo odvode

![[Pasted image 20241127083821.png]]

- Detektorji robov implementirajo numericni izracun odvoda z uporabo t.i. koncne diference
$$f_x(x,y) = \frac{f(x+h, y) - f(x-h,y)}{2h}$$
Za detekcijo robov v X smeri

Za detekcijo robov v obeh smereh na sliki, poznamo vec operatorjev, najbolj znani med njimi so:
- Robertsov operator
- Prewitt operator
- Sobel operator
- Matlab funkcije kot so edge(), imgradient(), ingradientxy()
## Sobel algoritem za detekcijo robov
1. Konvolucija s 1. sobelovo masko (horizontalna smer)
2. Konvolucija z 2. sobelovo masko (vertikalna smer)
Zdaj imamo komponenti intenzitete gradientnega vektorja na vsakem polozaju piksla
3. Izracunamo magnitudo gradienta, to nam da kandidate za robne tocke
4. Gradient upragovimo, da dobimo mapo robov
5. Za povezovanje robnih tock lahko uporabimo tudi smer gradienta
![[Pasted image 20241127084714.png]]

## Vpliv suma na zaznavanje robov
Za zaznavanje robov nam sum predstavlja resen problem, saj predstavlja visokofrekvencno motnjo, na katero so filtri za zaznavanje robov zelo obcutljivi. Osumljeni piskli so zelo razlicni id svojih sosedov, kar pomeni, da je gradient zelo velik

Resitev je glajenje slike z npr. gaussovim filtrom, vendar s tem ne zreduciramo samo suma, ampak tudi informacijo o robovih

![[Pasted image 20241127085251.png]]

### Konvolucija z odvodom
- Konvolucija in odvajanje sta linearni operaciji
$$\frac{d}{dx}(f*g) = f*\frac{d}{dx}g$$
- Ta lastnost nam lahko prihrani eno operacijo
![[Pasted image 20241127085550.png]]

## Generalni pristop k iskanju robov
- Z nizkoprepustnim Gaussovim filtrom s primernim parametrim $\sigma$ potlacimo sum
- Izracunamo odvode (intenzitetni gadient), da dobimo mapo robov
- Upragovimo sliko
Lahko tudi zdruzimo prva 2 koraka, s tem da uporabimo odvode Gaussovega fultra in s tem naredimo konvolucijo na sliki

## Kompromis med glajenjem in lokalizacijo
- Glajenje odstrani sum, kar pomeni, da povecini eliminira lazne robne tocke, to izboljsa __detekcijo robov__
- Vendar, glajenje zamegli tudi dejanske robove (debelejsi grebeni)
- To nam onemogoci natancno dolocanje, kje robovi dejansko lezijo, torej glajenje poslabsa lokalizacijo robnih tock
![[Pasted image 20241127090513.png]]

## Nacrtovanje detektorja robov
Kriteriji za dober ali idealen detektor robov:
- Dobra detekcija
	- Optimalni detektor naj najde vse robove, pri tem ignorira sum in druge artifakte
- Dobra lokalizacija
	- Zaznani robovi naj bodo najblizje dejanskim polozajem (idealno na tocno istem polozaju)
- Detektor naj vrne eno samo tocko na robu

V praksi se nam dogaja, da imamo lazne zaznave robov, nepravilne polozaje in vec rezultatov za isti rob

## Detektor Canny
- Odporen na aditivni sum
- Dobra lokalizacija, rezultat je zelo blizu prave lokacije
- Samo en rezultat za en rob

Najverjetneje najsirse uporabljeni detektor robov, implementacija:
- Gaussovo filtriranje s primerno vrednostjo $\sigma$
- Racunanje gradientnih komponent
- Racunanje magnitude in smeri gradienta
- Potlacitev nemaksimalnih vrednosti
- Histerezno upragovljanje z visoko in nizko mejo
Namesto racunanja odvodov slike uporabimo konvolucijo z odvodom Gaussa

$$e(x,y) = \nabla(g(x,y)*f(x,y) = \Bigg[\begin{align}\nabla_xg(x,y)*f(x,y) \\ \nabla_yg(x,y)*f(x,y) \end{align}\Bigg] = $$
$$ = \Bigg[\begin{align} g(x,y)*f(x,y) \\ g(x,y)*f(x,y) \end{align}\Bigg] = $$
$$=\Bigg[\begin{align}g_x(x)*g(y) *f(x,y) \\ g(x)*g_y(y) * f(x,y) \end{align}\Bigg]$$
![[Pasted image 20241127100512.png]]
### Supresija nemaksimalnih vrednosti (Canny)
Analogija za supresijo nemaksimalnih vrednosti in histereznega upragovljanja je hoja po grebenu, kjer visina odraza intenziteta roba na sliki
![[Pasted image 20241127100626.png]]

### Histerezno uporagovljanje (Canny)
- Ce velja: $mag(gradient) > T_U$ , je piksel rob, zacnemo mu slediti
- Ce velja: $mag(gradient) < T_L$ , piksel ni rob, nehamo mu slediti
($T_u \quad in \quad T_L$) sta zgornja in spodnja meja histereznega upragovljanja

![[Pasted image 20241127101002.png]]

# Zaznavanje vogalov
Kaj je vogal? 
- Vogali so tocke, ki se razlikujejo od svojih sosednjih tock, preferabilno v vseh smereh
![[Pasted image 20241127101131.png]]

Postopek iskanja vogalov:
- Izracunamo odvode ($e$) v smereh $x$ in $y$ 
- Izracunamo matriko $C$ v majhni okolici tocke, ki nas zanima
$$C(x,y) = \Bigg[\begin{align} \sum e^2_x && \sum e_xe_y \\ \sum e_x e_y && \sum e_y^2 \end{align} \Bigg ]$$
- Za vsak piksel na sliki imamo vrednost $C$
	- Za matriko $C$ izracunamo lastne vrednosti
$$C(x,y) = M \space \Lambda M = M \begin{bmatrix}\lambda_1 && 0 \\ 0 && \lambda_2 \end{bmatrix}M^T$$
- Matrika $C$ je simetricna, matrika  lastnih vektorjev ($M$) pa ortogonalna
- Tocko $(x,y)$  oznacimo, kot vogal, ce sta obe lastni vrednosti zadostno veliki
- Z matriko $M$ zarotiramo matriko $C$, s cimer postane diagonalna, ce ena od lastnih vrednosti s tem postane 0, pomeni, da je tocka na robu
![[Pasted image 20241127102125.png]]
- Za vogale velja, da sta obe lastni vrednosti $(\lambda_1 in \lambda_2)$ veliki

# Houghov transform
Houghov transform nam omogoca detekcijo visjenivojskih struktur na slikah, kot so crte ali krogi iz robov, Houghov transform je baziran na sistemu "voljenja", strukture ki imajo vec glasov, so mocneje reprezentairani na sliki

![[Pasted image 20241127103222.png]]

## Houghov transform za crte
- Houghov prostor je parametricen
- V nasem primeru je model enacba premice z 2 parametroma, $k$ in $n$. Torej je  ta prostor 2 dimenzionalen
![[Pasted image 20241127103435.png]]
- Pri eni dani tocki $(x_1,y_1)$ na vhodni sliki, je lahko skoznjo narisana katerakoli crta $(k,n)$
$$y_1 = k\cdot x_1 + n \mapsto n = -x_1\cdot k + y_1$$
- Vsi pari $(k,n)$, ki ugodijo ti linearni odvisnosti so validni kandidati

__Primer:__
- Vzemimo tocko $(x_1,y_1,) = (4,10)$ 
- Skoznjo je lahko narisano arbitrarno stevilo premic
![[Pasted image 20241127103809.png]]
- Ce si predstavljamo, da smo  skozi tocko narisali horizontalno crto, $k =0, n = 10$ , velja zanjo enacba: $y = 10$
- Celica $(k,n) = (0,10)$ tako dobi en glas

- Ce vzamemo spet isto tocko $(x_1, y_1) = (4,10)$
- In skoznjo narisemo novo premico, $k=0,75, n = 7$, zanjo velja: $y = 0,75\cdot x + 7$
![[Pasted image 20241127104342.png]]
- Zdaj celica $(k,n) = (0.75, 7)$ dobi en glas

Ce imamo naprimer 3 tocke: $(x_1, y_1), (x_2, y_2), (x_2, y_3)$. In te tocke lezijo na eni liniji, kaj se zgodi v Houghovem prostoru?
- Za vsako tocko lahko narisemo vec crt, ki zadostijo enacbam:
$$\begin{align} n = -x_1\cdot k +y_1 && n = -x_2\cdot x +y_2 && n = -x_3 \cdot k + y_3 \end{align}$$
- Samo ena od teh crt je sla skozi vse 3 tocke, torej je dobila __3 glasove__, ta tocka je $(k', n')$
- Torej, 3 tocke na sliki podpirajo model $y = k' \cdot x + n'$

V prakticnih situacijah obstaja na sliki veliko struktur, ki vsebujejo ravne crte,. Vsaka od teh struktur vrne veliko stevilo glasov za vsako specificno celico v Houghovem prostoru

Zaradi hrupa na sliki, bodo obstajali skupki tock, ki bodo imeli visje vrednosti od ostalih celic na sliki

Za detekcijo teh skupkov uporabimo upragovljanje, nato pa izracuamo sredisca teh skupkov, da lahko predvidimo parametre modela, v tem primeru $k$ in $n$
## Houghov transform za druge strukture
- Generalizirano lahko uporabljamo Houghov transform za kakrsenkoli paramtericen model, ne samo crt (npr. kroge)
- Algoritem:
	- akumulator nastavimo na 0
	- za vsako tocko na sliki inkrementiramo akumulator, ce velja: $f(x,y,q) = 0$
	- $H(q) = H(q) + 1$ (lahko uporabimo tudi kak drugo vrednost inkrementa, ne nujno 1)
	- Poiscemo lokalni maksimum H
Za detekcijo crt skoraj nikoli v preksi ne uporabljamo modela $y = k\cdot x + n$, saj ne omogoca detekcije navpicnih crt (parameter k bi moral biti neskoncen), zato uporabljamo model:
$$\rho = x\cdot cos(\theta) + y \cdot sin(\theta)$$
![[Pasted image 20241127105950.png]]
Svetle vrednosti na grafu signalizirajo veliko stevilo glasov za posamezno premico

