# Sistemska dinamika
Zgodovinsko ozadje podrocja:
- Sistemska dinamika je metodologija in tehnika modeliranja s pomocjo racunalniske simulacije
- Danes so glavna podrocja uporabe sistemske dinamike so __druzbeni sistemi__ in njihovo uporavljanje, uveljavila pa se je tudi na podrocjih biologije, medicine, ekologije itd
Sistemska dinamika predstavlja strategijo modeliranja, ki je dozivela precejsnjo odmevnost na podrocjih induktivnega modeliranja, torej na podrocjih, __kjer klasicnih fizikalnih zakonitosti praviloma ne poznamo__

Ideja temelji na:
- definiciji naora spremenljivk, ki predstavljajo _elemente postopka modeliranja_
- izbiri za problem pomembnih oz. _vplivnih velicin_
- konstrukciji vplivnega diagrama, ki nakazuje vplive opazovanih spremenljivk
- konstrukciji _strukturenga diagrama_, ki nakazuje vplive opazovanih spremenljivk 
- Konstrukciji _strukturnega diagrama_, ki definira strukturo grajenega modela
- parametrizaciji modela
- simulacijskemu resevanju

## Pristop k modeliranju z metodo SD
Pri gradnji modelov, ki temeljijo na pristopu SD se srecujemo z naslednjimi _gradniki_ oz. _elementi modelov_:
1. Nivoji
2. Vhodnimi in izhodnimi pretoki
3. Pretvorniki
4. Informacijskimi tokovi
5. Povratnimi zankami
6. Zakasnitvami

### 1. Nivoji
- stanja sistema, t.i. velicine, ki imajo lastnost akumulacije (izhod integratorja)
- so _spominski elementi_ sistema
![[Pasted image 20241126113326.png]]
### 2. Vhodni in izhodni pretoki
- Vplivajo na spreminjanje nivoja oz. stanja
- Oblacki na levi in desni nakazujejo neskoncen izvor oz. ponor opazovanega dela
![[Pasted image 20241126113436.png]]
### 3. Pretvoniki
- Pomozne spremenljivke ali dinamicne spremenljivke, ki pskbijo za harmonizacijo enacb
- Oznacujejo jih obicajno s krogci. Predstavljajo lahko izvor informacij ali pa nastopajo v vlogi prenasalca informacij
![[Pasted image 20241126113741.png]]

### 4. Informacijski tokovi
- Nadzorujejo povezavo velicin
![[Pasted image 20241126113813.png]]
### 5. Povratna zanka
- Sluzi oznacevanju smeri povratne zanke, z dodatnim besedilom pa opise njen pomen. Gradnik __ne sluzi dolocanju povratnih zank__, namenjen je le olajsevanju razumevanja diagrama. Dolocamo lahko smer in tip povratne zanke
	- __neagativna povratna zanka:__ vpliva zmanjsevalno na opazovano spremenljivko sistema (naceloma ohranja stabilnost)
		- ![[Pasted image 20241126114013.png]]
	- __pozitivna povratna zanka:__ veca opazovano spremenljivko sistema
		- ![[Pasted image 20241126114104.png]]

### 6. Zakasnitev
- Vpliva na spremembo stanja elementa, katerega vrednost se spremeni sele po casu zakasnitve
![[Pasted image 20241126114154.png]]


Koncept opisanih elementov je povsem splosen, interpretacija je zelo sobodna, kar je hkrati lahko tako prednost, kot tudi slabost vpeljane metodologije, npr:
- __Pretok__ lahko predstavlja elektricni tok, tok tekocine, tok informacij, tok ljudi, tok denarja,...
- __Nivo__ lahko predstavlja shranjen naboj, shranjena tekocina, kolicina ljudi, denarja,...

Pristop k modeliranju, ki se ocitno nakazuje v tem primeru, je pristop, ki bo rezultiral v zapis enacb stanja sistema za vsak nivo. Tisto kar je znacilnost SD, pa je _metodologije_, ki nas pripelje do teh enacb

## Metodologija
Metodolosko lahko razvoj sistema opisemo z naslednjimi koraki:
1. Izbira za problem pomembnih, oz. __vplivnih velicin__
2. Konstrukcija __vplivnega diagrama__, ki lahko nakazuje vplive opazovaniuh spremenljivk
3. Konstrukcija __strukturnega diagrama__, ti so zelo podobni vplivnim in jih skusajo nadgraditi. Od njih se locijo v tem, da __zahtevajo definicijo vlog posameznih spremenljivk__
4. Kontrukcija simulacijskega programa. Temelji na strukturnem diagramu, zahtevajo dopolnitev predstavitve modela z vrednostmi parametrov in signali vzbujanja
### Primer: opazujemo skupino ljudi

Pri opazovanju skupine nas znima:
- Kaj se bo z njimi zgodilo v prihodnje
- Kako na to vpliva njihovo stevilo ali lastnosti
- Katere lastnosti so pri tem pomembne
- Kako bo to vplivalo na razmere v drzavi kjer se nahajajo
- Ali to lahko vpliva tudi na razmere v sosednjih drzavah
- Ali lahko razmere v sosednjih drzavah vplivajo na te ljudi

Eni od pomembnih lastnosti, ki vpliva na zastavljena vprasanja sta lahko __starost__ in __druzbena aktivnost__

![[Pasted image 20241126115233.png]]

- Katera skupina bo zivela dlje in kaj od nastetega je pomembno?

Ena od pomembnih lastnosti, ki vpliva na zastavljena vprašanja je lahko: __starost in različne bolezni__

![[Pasted image 20241126115412.png]]

Pomembne lastnosti ki lahko vplivajo na zastavljena vprasanja so lahko tudi __soodvisne__, npr. od telesne mase

- diabetes(85% pacientov z D2 je debelih)
- Povisan holesterol in krvni tlak
- Kardiovaskularne bolezni
- Muskuloskeletalne tezave
- Nekatere vrstega raka

Vplivne velicine pri obravnavi __debelosti__:
-  masa cloveka, ki ga opazujemo
-  hranjenje
- telesna aktivnost (energijska poraba)
- telesne znacilnosti (energijska poraba zaradi bazalnega metabolizma)
- motiviranost za aktivnost, za primerno hranjenje...

Konstrukcija __vplivnega diagrama__, ki je povsem kvalitativno nakazuje vplive opazovanih spremenljivk

![[Pasted image 20241126120058.png]]

Vplivne velicine pri obravnavi __populacije:__
- stevilcnost populacije
- rosjtva
- smrti
- stopnja rojstev
- stopnja smrti

Konstrukcia __vplivnega diagrama__, ki povsem kvalitativno nakazuje vplive opazovanih spremenljivk

![[Pasted image 20241126120243.png]]

Konstrukcija __strukturnega diagrama__ na podlagi __vplivnega diagrama__:
- Strukturni diagrami so zalo podobni vplivnim diagramom in jih skusamo nadgraditi
- Od vplivnih diagramov se locijo po tem, da zahtevajo __definicijo vlog posamenih spremenljivk__
- Programska okolja namenjena SD uporabljajo elemente in predstavitve, ki upostevajo vlogo spremenljivk v obravnavanem primeru

Konstrukcija strukturnega diagrama na podlagi vplivnega sistema:
- Strukturni diagrami zahtevajo __definicijo vlog spremelnjivk__
![[Pasted image 20241126123415.png]]
Vsebuje:
- __Nivo__ populacije
- __Vhodni pretok__ rojstev
- __Izhodni pretok__ smrti
- Informacijske tokove
- __Pretvornike__ (stopnji smrti in rojstev)

Velikost pretokov je odvisen od velikosti __nivoja__ in __informacijskih tokovov__ (enojna puscica) v odvisnosti od __pretvornikov__ kot sta stopnja smrti in rojstva

Paziti moramo, da pri tvorbi modela ne tvorimo algebrajskih zank

#TODO dopolni metodologijo (407-prostorni model)

# Prostorni modeli
Predstavitev prostornega modela
![[Pasted image 20241126133703.png]]

Vsak podmodel opisemo s svojo diferencialno enacbo

Prostorne modele lahko zapisemo v prostoru stanj
$$\begin{gather}
\dot x(t) = Ax(t) + Bu(t) \\
y(t) = Cx(t) + Du(t)
\end{gather}$$
- Izbira izhodov pri razvoju modela obicajno ni kljucna. To je pomembno pri nacrtovanju vodenja
Prostorni modeli se uporabljajo na naslednjih podrocjih:
- biologija
- medicina
- farmacija
- apidemiologija
- biotehnologija
- okoljevrastvo
- populacijska problematika
- sociologija
- psihologija
### Primer: model izlocanja zdravila (farmakokinetika)
Pomembna dejstva:
- Premajhna koncentracija zdravila v krvi $\rightarrow$ neucinkovitost zdravila
- Prevelika koncentracija zdravila v krvi $\rightarrow$ toksicnost zdravila
- Primeren (enakomeren in ne prepogost) razmik v doziranju
- Primerni odmerek pripravka (zacetnega in nadaljnih)

Predpostavke:
- $y(t)$: koncentracija zdravila v krvi v trenutku $t$
- velikost spremembe koncentracije je proporcionalna kolicini zdravila v krvi
- $k$: pozitivna konstanta, ki jo je potrebno eksperimentalno dolociti za zdravilo, ki ga obravnavamo
- zdravila se v trenutku aplikacije takoj in popolnoma absorbira v krvi

Model izlocanja zdravila lahko modeliramo kot sistem 1. reda:
$$\frac{dy(t)}{dt} = -ky(t)$$
Izhod modela v casovnem prostoru je torej:
$$y(t) = y_0e^{-kt}$$
pri cemer je $y_0$ kolicina zdravila, ki jo je pacient zauzil v trenutku $t = t_0$
Tezava ki se pri tem pojavi izhaja iz dejstva, da je zgornji potek ucinkovanja zdravila veljaven le za enkratni odmerek. Ce je potrebno zdravilo dovajati neprestano, je potrebno model dopolniti, tako da bo v njegovem izhodu vkljuceno doziranje zdravila ob razlicnih casovnih trenutkih

S $T$ oznacimo casovni razmik med uporabo predvidenega odmerka $y_0$. Potem velja:
$$\begin{gather}
y(t) = y_0e^{-kt} \quad za \quad t \leq T \\
y(t) = y_0(1+e^{-kt})e^{-k(1-t)} \quad za \quad t\geq T\\
\vdots \\
y(t) = y_0(1+e^{-kt} + e^{-2kt} + \cdots + e^{-nkt}) \quad za \quad t\geq nT
\end{gather}$$
Kolicina zdravila v krvi pa limitira proti vrednosti v nasicenju

$$y_s = \frac{y_0}{1-e^{-kt}}$$
Cilj doziranja zdravila je, da je njegova koncentracija v krvi __cim blizje optimalni__, a hkrati __ne preseze maksimalne dovoljene__


## Topologija prostornih modelov

Prostorne modele delimo na:
- __odprte modele:__ v katere lahko pretoki iz okolice in drugih prostorov vstopajo in iz njih izstopajo. To pomeni, da pri taksnih modelih lahko obstajajo vplivi na dogajanje v prostoru iz okolice, prav tako pa lahko dogajanje v prostoru vpliva na okoliske sisteme
- __zaprte sisteme:__ ki nimajo interakcij z okolico. V taksen prostor ni dotokov, niti iz prostora nic ne izteka
