1. Prednosti digitalne realizacije vodenja pred analogno:
	- Digitalni signali _niso dovzetni lezenju_ in so _neobcutljivi na okoljske faktorje_, kot so npr. temperatura in motnje
	- Omogoca _poljubno natancnost_ nastavitve parametrov in izvedbe operacij.
	- _Bistveno enostavnejsa implementacija spomina_
	- Omogoca enostavnejso izvedbo klasicnih algoritmov, poleg raznih sodobnih, kot so:
		- _Adaptivno_ vodenje
		- _Prediktivno_ vodenje
		- _Mehko (fuzzy)_ vodenje
		- ...
2. Opišite pojme oz. opredelite razliko med njimi: časovno zvezni signal, analogni signal, časovno diskretni signal, digitalni signal.:
	- __Casovno zvezni signal:__ Signal, ki je definiran na _zveznem casovnem intervalu_, njegova amplituda lahko zajema _diskretne ali zvezne vrednosti_
	- __Analogni signal:__ Signal, ki je definiran na _zveznem casovnem intervalu_, njegova amplituda lahko zavzame _zvezno podrocje vrednosti_
	- __Casovno diskretni signal:__ Definiran je na diskretnih casovnih intervalih $f(k); k\in N$, neodvisna spremenljivka je _kvantizirana_, ce njegova amplituda zajema _zvezno podrocje vrednosti_ mu recemo __vzorceni signal__
	- __Digitalni signal:__ je definiran na _diskretnih casovnih intervalih_, njegova _amplituda_ je prav tako _kvantizirana_
3. Tipična bločna shema sistema digitalnega vodenja?
	![[Pasted image 20250208004301.png]]
4. Kvantizacija po amplitudi, resolucija A/D pretvornika, kvantizacijski pogrešek
	- _Vzorcevalnik_ zadrzi vhodno napetost, za casa _A/D_ pretvorbe
	- _A/D_ pretvornik je kaskada delilnikov napetosti s primerjalniki
	- _Resolucija A/D pretvornika:_ $$res = \frac{U_{ref}}{2^n}$$ kjer je  $n$ stevilo bitov pretvornika
	- _Pogresek_ pretvorbe je $$q = \frac{U_{LSB}}{2}$$
5.  Razlika med pojmoma vzorčeni signal in vzorčeni diskretni signal
	- _Vzorceni signal_ ima diskreten casovni interval,  vendar amplituda zajema _zvezno obmocje vrednosti_, medtem ko,
	- _Vzorceni diskretni signal_ pa ima kvantizirano tako _casovno, kot tudi amplitudno os_
6. Vzorčenje signalov s pulzi končne širine – časovne funkcije in pripadajoči spektri
	- Vzorcimo tako, da _zvezni signal mnozimo z vlakom pulzov_ $x^*(t) = x_z(t)\cdot p_z(t)$ 
	![[Pasted image 20250208202532.png]]
	- Zadnji signal na sliki opisemo s formulo: $$x^*(t)= \sum_{m=-\infty}^\infty c_mx_z(t)\cdot e^{jm\omega_st}$$kjer so:
		- $c_m$ _koeficienti ojacanja posamezne frekvence_, ki imajo frekvencni potek v obliki _kardinalnega sinusa_ $Ad sinc(md)$
		- $\omega_s$ _krozna frekvenca vzorcenja_ $2 \pi f_s$ 
		- $c_m \space in \space e^{jm\omega_s t}$ izhajata iz enacbe za _fourierovo transformacijo vlaka pulzov_ $p_z(t)$ 
	- __Frekvencni spekter__ vzorcenega signala dobimo s _fourierovo transformacijo_ in sestoji iz spektra originalnega signala pomnozenaga s $c_m$ in iz neskoncnega stevila _kopij originalnega spektra_, ki so bili _zamaknjeni_ za mnogokratnike _frekvence vzorcenja_
	- Komponente z visanjem frekvence pocasi zginevajo _zaradi frekvencnega poteka_ $c_m$
7. Idealno impulzno vzorčenje – časovne funkcije in pripadajoči spektri
	- Idealno pulzno vzorcenje opisuje proces vzorcenja z _neskoncno ozkimi Diraccovimi_ impulzi $\delta(t-kT)$ $$p_\delta(t) = \sum_{k=-\infty}^\infty \delta(t-kT)$$
	- Vzorceni signal zapisemo v _tej obliki_ $$x^*(t)=  x_z(t)p_\delta(t) = x_z(t) \sum_{k=-\infty}^\infty \delta(t-kT)$$
	- _Frekvencni spekter_ dobimo s fourierovo transformacijo zveznega signala, pomnozenega z vlakom impulzov. $$X(f) = \frac{1}{T} \sum_{m = -\infty}^\infty X_z(f- mf_s)$$
	- Razlika med vzorcenjem s pulzi _končne širine_ (zgoraj) in _idealnim pulznim vzorčenjem_  (spodaj) je, da pri slednjem,  z visanjem frekvence ne izginejo komponente
	 ![[Pasted image 20250208212740.png]]
	 ![[Pasted image 20250208212824.png]]
	 
8. Teorem o vzorčenju in razlaga teorema z analizo spektra.
	- _Shannon-Nyquistov_ teorem o vzorcenju narekuje, da mora biti vzorcna frekvenca vsaj dvakrat visja od vzorcene, da lahko rekonstruiramo originalni signal $f_s > 2f_h$
	- Originalni signal dobimo iz vzorcenega z _nizkoprepustnim filtrom_, kjer je _mejna frekvenca_ nekje med $f_s$ in $f_s - f_h$
	- __Zgibanje (aliasing)__ je pojav, ko se _vec razlicnih frekvenc zveznega signala preslika v eno frekvenco vzorcenega signala_, to nam omogoci rekonstrukcijo originalnega signala iz vzorcenega 
	![[Pasted image 20250208213553.png]]
	Kjer $f_z$ predstavlja frekvenco zveznega signala, $f_d$ pa njegovo _preslikavo v vzorcenem signalu_, v odvisnosti od vzorcne frekvence

9. Opredelite pojme: Frekvenca zgibanja, Nyquistova frekvenca, Nyquistova hitrost
	- __Frekvenca zgibanja ALI Nyquistova frekvenca__, je frekvenca, ki je enaka polovici vzorcne, to je _lastnost sistema vzorcenja_. Pri frekvencah, ki so _visje od nyquistove frekvence zacne prihajati do zgibanja._ Takega signala ni vec mogoce rekonstruirati iz njegovega spektra
	- __Nyquistova hitrost__ je enaka _dvakratni vrednosti najvisje frekvence v zveznem signalu_, je lastnost frekvencno omejenega signala.

10. Whittaker–Shannonova interpolacijska formula. Zakaj se uporablja? Ali je primerna za uporabo pri sistemih digitalnega vodenja? 
	- $$x_z(t) = \sum_{k=-\infty}^{\infty} x_z(kT) \frac{\sin \pi f_s (t - kT)}{\pi f_s (t - kT)} = \sum_{k=-\infty}^{\infty} x_z(kT) \operatorname{sinc}(f_s (t - kT))$$
	- Ta formula se _uporablja za rekonstrukcijo zveznega signala_ (frekvencno omejenega) _iz njegovih vzorcev_
	- Enacba _ni uporabna v zaprtozancnem vodenju_, saj je idealni filter __nekavzalen__, kar pomeni, da je njegov impulzni odziv za case, manjse od 0 _razlicen od nic_, kar je razvidno iz slike:![[Pasted image 20250208215302.png]]
	- To pomeni, da potrebujemo za dolocitve vrednosti zveznega signala v poljubnem casovnem trenutku tudi _vzorce iz prihodnosti_, kar pa v digitalnem vodenju ni mozno

11. Zadrževalno vezje kot sistem za rekonstrukcijo zveznega signala. Prednosti in slabosti (utemeljitev na osnovi frekvenčnega odziva).
	- Zadrzevalno vezje predstavlja neko obliko nizkoprepustnega filtra
	![[Pasted image 20250208220447.png]]
	- Prenosna funkcija _zadrzevalnika nictega reda (ZOH) je:_ $$G_{ZOH}(s) = \mathcal{L}{g_z^{ZOH}(t) = \frac{1}{s}-\frac{e^{-sT}}{s}} = \frac{1-e^{-sT}}{s}$$
	- Njegov _frekvencni odziv_ dobimo, ce $s$ v zgornji enacbi nadomestimo z $j\omega$. Dobimo njegov _amplitudni odziv_ in _fazni odziv_  $$\begin{gather} A(f) = T\frac{sin \pi f T}{\pi f T} = T sinc(fT) = \frac{sinc(f/f_s)}{f_s} \\ \beta (f) = -\pi f T = - \pi \frac{f}{f_s}\end{gather}$$
	![[Pasted image 20250208224919.png]]
	Frekvencni spekter ZOH je _definiran samo na obmocju_ $[0, \frac{1}{2T_s})$, saj se izven tega obmocja sistem ne odzove vec z vzbujalno frekvenco, zaradi krsenja vzorcnega teorema

12. Štiri oblike Fourierove transformacije glede ne zveznost oz. diskretnost časovnih in frekvenčnih funkcij
	-  **Zvezna časovna in zvezna frekvenčna domena**: Standardna Fourierova transformacija. 
		- Pretvori _zvezni signal v zvezni spekter_
		- Uporablja se v _klasicni analizi signalov in sistemov_
	-  **Zvezna časovna in diskretna frekvenčna domena**: Fourierova vrsta.
		- _Periodicni signal_ razvijemo v _vsoto harmonicnih komponent_
		- Diskreten frekvencni spekter, saj ima signal _koncno stevilo harmonicnih komponent_
	-  **Diskretna časovna in zvezna frekvenčna domena**: Transformacija za diskretne signale. 
		- Uporabna za analizo _diskretnih signalo_, vendar ima _zvezen frekvencni spekter_
		- Pomembna je za analizo sistemov v _digitalnem vodenju_
	- **Diskretna časovna in diskretna frekvenčna domena**: Diskretna Fourierova transformacija (DFT)
		- ima _diskreten frekvencni spekter_, zato se uporablja v _racunalniski obdelavi signalov_, algoritem je znan tudi pod imenom FFT (fast fourier transform)
		- uporablja se pri _spektralni analizi diskretnih signalov_
13. Z-transformacija
	- Z-transformacija je metoda za analizo diskretnih sistemov v domeni kompleksne spremenljivke $z$. 
	- _Diskretni ekvivalent Laplacove transformacije_, omogoca analiticno obliko zapisa diferencnih enacb
	-  Definicija: $$X(z) = \mathcal{Z}\{x(k)\} = \sum_{k=-\infty}^{\infty} x(k) z^{-k} $$
	 - Pricakujemo _kavzalen signal_ $x(k) = 0 ; k<0$

14. Teoremi Z-transformacije 
	- Teorem _linearnosti:_ $$\mathcal{Z}\{a_1x_1(k) + a_2 x_2(k)\} = a_1X_1(z) + a_2 X_2(z)$$
		- Narekuje, da je _Z-transformacija linearna operacija_
		- __>>>__ *Z transformacija linearne kombinacije* signalov je *enaka linearni kombinaciji z-transformacij* signalov

	- Teorem _casovnega premika v desno:_(zamik)$$\mathcal{Z}\{x(k-m)\} = z^{-m} X(z)$$
		- Teorem velja, samo, ce je signal $x(k)$ _kavzalen_
		- $m$ nakrekuje, za _koliko vzorcev je signal prestavljen v desno_

	- Teorem _časovnega premika v levo:_ $$\mathcal{Z}\{x(k+m)\} = z^m \left[X(z) - \sum_{k=0}^{m-1}x(k)z^{-k} \right]$$
		- Z transformiranko signala, ki je premaknjen za _m vzorcev v levo_ dobimo tako, da _odrezemo prvih $m$ vzorcev_ in _pomnozimo transformacijo originalnega signala z $z^m$_

	- Teorem _eksponentnega dusenja:_ $$\mathcal{Z}\{a^{-k}x(k)\} = X(az)$$
		- Z-trensformiranko signala, ki je pomnozen z $a^{-k}$ (eksponencialno padajoca funkcija), dobimo tako, da _pomnozimo argument z-transformacije originalnega signala s konstanto a_

	- Teorem _zacetne vrednosti:_ $$\lim_{k\rightarrow0}x(k) = \lim_{z\rightarrow \infty}X(z)$$
		- Ce je signal $x(k)$ _kavzalen in obstaja njegova limita, ko gre k proti 0,_ jo lahko izracunamo po zgornji formuli

	- Teorem _koncne vrednosti:_ $$\lim_{k\rightarrow \infty}x(k) = \lim_{z\rightarrow 1}(z-1)X(z)$$
		- Ko vsi poli izraza $(z-1)X(z)$ lezijo znotraj enotne kroznice, _obstaja limita koncne vrednosti signala $x(k)$, ki jo izracunamo po zgornji formuli_

	- Teorem _mnozenja s $k^x$:_ $$\mathcal{Z}\{k^rx(k)\} = \left(-z\frac{d}{dz}\right)^rX(z)$$
		- Z-transformacijo signala, ki je bil pomnozen s $k^r$, dobimo tako, da _$r-krat$ odvajamo transform originalnega signala po spremenljivki $z$, ter rezultat pomnozimo z $(-z)$

	- Teorem _diferenciranja funkcije po parametru:_ $$\mathcal{Z} \{\frac{\partial}{\partial a}x(k,a) \} = \frac{\partial}{\partial a}X(z,a)$$
		- Če *signal odvajamo po parametru*, dobimo njegovo z-transformacijo tako, da *tudi z-transformacijo originalnega signala odvajamo po tem parametru*

	-  Teorem _konvolucije:_ $$\mathcal{Z}\{\sum_{m=0}^k x(m)h(k-m)\} = X(z)H(z)$$
		- Z-transfrormacijo konvolucije dveh kavzalnih signalov dobimo z _mnozenjem njunih z-transformov_

15. Inverzna z-transformacija
	- Preslikava kompleksne funkcije $X(z)$ v zaporedje stevil $x(k)$, oziroma v niz impulzov $x^*(t)$ $$x(k) = \frac{1}{2 \pi j} \oint_C X(z) z^{k-1} \,dz$$
	- Krivulja $C$ _obkrozi vse singularnosti funkcije_ $X(z)z^{k-1}$ v nasprotni smeri urinega kazalca
	- Obstaja *vec metod* izracuna inverzne z transformacije
		- uporaba tabel z-transformacije
		- izračun s pomočjo residualnega teorema
		- metoda parcialnih ulomkov
		- metoda deljenja
		- uporaba računalniških orodij
16. Povezava med ravninama $z$ in $s$. Preslikava krivulj konstantnega relativnega časa umiritve.
	- Lega polov v kompleksni ravnini ima pomemben vpliv na obliko signala, tako zveznega signala v $s$ ravnini, kot tudi _diskretnega signala v $z$ ravnini_
	- Med ravninama _velja povezava:_ $$z = e^{sT} = e^{(\sigma + j\omega)} = e^{\sigma T} \cdot e^{j\omega T}$$
		- _Amplituda kompleksnega stevila $z$_, je definirana kot: $|z| = e^{\sigma T}$
		- _Faza kompleksnega stevila $z$_, je definirana kot: $arg z = \sphericalangle z = \omega T$
	- Vsaki tocki v ravnini $s$, _odgovraja tocka v ravnini $z$_, katere _amplituda je dolocena z realnim delom tocke $s$_, _faza pa z imaginarnim_
	![[Pasted image 20250209175711.png]]
	-  Krivulje _konstantnega relativnega casa umiritve_, so krivulje v $s$ ravnini, za katere velja, da imajo enek cas umiritve $T_s$. So vertikalne crte v $s$ ravnini, saj realni del pola ostane enak, spreminja se le imaginarni del. V $z$ ravnini, se te krivulja preslikajo v _koncentricne kroznice_, s polmerom $$e^{\sigma_CT}$$
	![[Pasted image 20250209181104.png]]

17.  Povezava med ravninama $𝑧$ in $s$. Preslikava krivulj konstantne frekvence.
	- Krivulje _konstantne frekvence_, so krivulje v $s$ ravnini, za katere velja, da imajo _konstanten imaginarni del_ $\omega$, torej predstavljajo _vodoravne crte v $s$ ravnini_.
	- V $z$ ravnini se _preslikajo v poltrake_, z izhodiscem v $z = 0$, ki tvorijo s pozitivnim delom realne osi, kot: $\omega_C T$
	![[Pasted image 20250209182147.png]]

18. Povezava med ravninama $z$ in $s$ Preslikava krivulj konstantnega relativnega koeficienta dušenja.
	- Krivulje _konstantnega relativnega reda dusenja_, so krivulje v $s$ ravnini, ki imajo kontanten faktor dusenja $\zeta$ , $\omega_n$ pa se spreminja od $0$, do $\infty$. V $s$ ravnini so predstavljene, kot _konjugirano kompleksni pari poltrakov_ $$s = (-\zeta \pm j \sqrt{1-\zeta^2})\cdot \omega_n$$
	- V ravnini $z$, se _preslikajo v spirale s parametrom $\omega_n$. Spirale so logaritmicne_, saj amplituda in faza $z$ narascata linearno z vecanjem $\omega_n$
	![[Pasted image 20250209191649.png]]
	- Modra krivulja ima manjsi koeficient dusenja, kot rumena

19. Lastnost preslikave $s$ → $z$ , s stališča injektivnosti, surjektivnosti in bijektivnosti (povratne enoličnosti) oz. kako je z enoličnostjo preslikave iz ene ravnine v drugo in nazaj. Kakšne so posledice teh lastnosti?
	- V eno tocko v ravnini $z$, se _preslika neomejeno stevilo tock iz ravnine $s$_
	- Ce se tocka $s_0$ preslika  v tocko $z_0$, se vanjo preslika tudi mnozica tock: $$s_0 +jl\omega; (l \in \mathcal{Z}),$$ ki so glede na tocko $s_0$, _premaknjene za celostevilski imaginarni mnogokratnik frekvence vzorcenja_, zato rekonstrukcija originalnega zveznega signala ni mogoca

20. Osnovni pas in komplementarni pasovi v ravnini $s$ ter njihova povezava z ravnino $z$
	- Osnovni pas je pas v $s$ ravnini, ki ga omejujeta premici: $$\begin{gather}j\omega = \frac{\omega_s}{2} &&  j\omega = -\frac{\omega_s}{2}\end{gather}$$
	- Zaprto podrocje osnovnega pasu, _se preslika v celotno ravnino $z$_. 
	- Vemo, da se *v iste tocke v ravnini $z$ preslikajo* tudi signali, ki so *premaknjeni za celostevilski mnogokratnik vzorcne frekvence*. Pasovom kjer se nahajajo tako premaknjeni signali, pravimo _komplementarni pasovi_
	- Ce zelimo, da pri vzorcenju _ne prihaja do zgibanja frekvenc_, morajo vsi originalni signali __lezati znotraj osnovnega pasu v ravnini $s$__
	![[Pasted image 20250209193114.png]]

21. Diferenčna enačba. Definicija reda. Delitev diferenčnih enačb. Način reševanja.
	- Diferencne enacbe so en osnovnih nacinov za zapis diskretnega sistema. Lahko jih razumemo, kot _diskretni ekvivalent diferencialnih enacb_ iz zveznega prostora
	- Diferencne enacbe _povezujejo razlicne vzorce iskanega zaporedja_ $y(k)$, z vzorci _danega zaporedja_ $u(k)$
	- _Glede na linearnost_ jih delimo na:
		- Linearne
		- Nelinearne
	- _Glede na casovno spremenljivost_, jih delimo na:
		- Enacbe s konstantnimi koeficienti
		- Enacbe s casovno spremenljivimi koeficienti
	- _Red diferencne enacbe_, nam predstavlja __razlika med najvecjim in najmanjsim indeksom zaporedja__ $y$
	- Diferencne enacbe resujemo _z uporabo z-transformacije_

22. Diskretna prenosna funkcija. Prehod diferenčna enačba → prenosna funkcija
	- Pogoj za obstoj prenosne funkcije je _casovno nespremenljiva, linearna diferencna enacba_
	- Ce $u(k)$ definiramo kot _vhodno zaporedje_ in $y(k)$ definiramo kot _izhodno zaporedje_ sistema dobimo prenosno funkcijo sistema tako, da _vse zacetne pogoje diferencne enacbe postavimo na 0_ $$G(z) = \frac{b_0 z^n + b_1z^{n-1} + \cdots + b_n}{z_n + a_1 z_{n-1}+\cdots + a_n}$$

23. Impulzni odziv diskretnega sistema. Povezava z diskretno prenosno funkcijo.
	- Impulzni odziv diskretnega sistema dobimo tako, da _diskretno prenosno funkcijo pomnozimo z z-ptransformom vhodnega zaporedja_, ter izvedemo _inverzno z-transformacijo_ na rezultatu

24. #TODO 

25. Zapis diskretnega sistema v prostoru stanj. Ali je zapis omejen na linearne in časovno nespremenljive sisteme?
	- Zapis v porstoru stanj, sestavljata 2 diferencni enacbi, ki jima pravimo:
		- Enacba stanj $$x(k+1) = \mathbf{A}\cdot x(k) + \mathbf{b}\cdot u(k)$$
		- Izhodna enacba $$y(k) = \mathbf{C^T}\cdot x(k) + d\cdot u(k)$$
		- Kjer so:
			- $\mathbf{A}$ : kvadratna matrika dimenzij $n*n$ (n je red sistema), pravimo ji _sistemska matrika_
			- $\mathbf{b}$ : stolpicni vektor velikosti $n$, pravimo mu _vhodni vektor_
			- $\mathbf{C^T}$ : Vrsticni vektor velikosti $n$, ki mu pravimo _izhodni vektor_
			- $d$ : Skalar, ki mu pravimo _vhodno-izhodna konstanta$_
	- Glavna prednost zapisa v prostoru stanj je, _da lahko opisemo tudi sisteme, ki niso linearni in casovno nespremenljivi_

26. Interpretacija diskretnega vektorja stanj
	- Vektor stanj predstavlja _stanje sistema v vsakem casovnem trenutku_, to lahko __nadomesca poznavanje dogajanja v preteklosti__
	- V kombinaciji z vhodnim vektorjem , nam vektor stanj sistema napoveduje _izhod sistema v prihodnosti_
	- _Dinamika sistema_ je zapisana z enacbo stanj, kar nam podaja __spremembo vektorja stanj v prihosnosti__

27. Simulacija linearnega diskretnega sistema, zapisanega v prostoru stanj. Bločna shema.
	-  Zapis v prosturu stanj je zelo *primeren za simulacije*. Edini dinamični element v tem zapisu je namreč predikcija vektorja stanj za trenutek $k+1$
	- Za bločno oz. simulacijsko shemo potrebujemo zakasnilni blok, ki ima prenosno funkcijo $z^{-1}$
	![[Pasted image 20250209200800.png]]

28. Odziv homogenega diskretnega sistema v prostoru stanj in diskretna matrika prehajanja stanj
	- Homogeni diskretni sistemi so sistemi, ki _nimajo zunanjega vzbujanja_, torej je odziv sistema _v celoti odvisen od zacetnega stanja sistema_, torej ga lahko opisemo z enacbo stanj:  $$x(k+1) = \mathbf{A}x(k)$$
	- Splosna resitev diferencne enacbe je: $$x(k) = \mathbf{A}^k \cdot x(0)$$
	- Matriko $\mathbf{A}^k$ imenujemo __diskretna matrika prehajanja stanj__

29. Pretvorba iz zapisa sistema v prostoru stanj v zapis s prenosno funkcijo 
	$$G(z) = \mathbf{C^T}(z\mathbf{I}-\mathbf{A})^{-1}\cdot \mathbf{b} + d$$
	- Pretvorba iz prostora stanj v prenosno funkcijo _ni enolicna_
	- Velja samo, ko je v prostoru stanj zapisan _linearen in casovno nespremenljiv sistem_

30. Ravnovesno stanje diskretnega sistema
	- Diskretni sistem je v ravnovesnem stanju, _ko je stanje v trenutku $k + 1$ enako stanju v trenutku $k$ $$x(k+1) = x(k)$$
	- V primeru _homogenega sistema_, to zapisemo kot: $$\mathbf{A}x(k) = x(k)$$
	- V primeru sistema, ki _ima zunanje vzbujanje_, se to glasi: $$\mathbf{A}x+\mathbf{b}u = x$$

31. Frekvenčni odziv diskretnih sistemov. Katere pogoje mora izpolnjevati sistem, da lahko definiramo njegov frekvenčni odziv? Amplitudni odziv, fazni odziv.
	- Za *stabilni linearni časovno nespremenljivi sistem* je *značilno, da se na harmonično vzbujanje po preteku prehodnega pojava odzove s harmoničnim nihanjem* izhodnega signala
	- _Frekvenci_ vhodnega in izhodnega harmonicnega signala _sta enaki_
	- Pogoj za izracun frekvencnega odziva je _stabilnost sistema_. vsi poli njegove prenosne funkcije morajo lezati _znotraj enotske kroznice_
	- __Fazni odziv:__ $$\sphericalangle H(e^{j\omega T}) = \phi_y - \phi_u$$kjer je $\phi_y$ _faza izhodnega signala_, $\phi_u$ pa faza izhodnega signala. Izracuni temeljijo na prenosni funkciji sistema $H$
		-  Fazni kot prenosne funkcije doloca fazno prehitevanje izhodnega signala za vhodnim pri frekvenci $\omega$. V vecini realnih primerov je fazni kot negativen in izhodni signal zaostaja za vhodnim
	- __Amplitudni odziv:__ $$|H(e^{j \omega T})| = \frac{Y_0}{U_0}$$
		- Absolutni del prenosne funkcije doloca razmerje med amplitudama izhodnega in vhodnega signala pri vzbujalni frekvenci $\omega$

32. Delitev metod za diskretizacijo zveznih sistemov
	- Diskretizacija zveznih sistemov je tezaven postopek, saj pri njem _inherentno izgubljamo informacijo_
	- Obstaja vec metod za diskretizacijo, ki temeljijo na _drugacnih predpostavkah o obnasanju sistema med trenutki vzorcenja_
	- Izhodiscni zvezni dinamicni sistem predstavimo kot $S_z$, _diskretni dinamicni sistem pa kot_ $S$. Definiramo transformacijo $D$, ki zvezni sistem preslika v diskretnega $$S_z
\xrightarrow{D} S$$
	- Metode delimo na:
		- Metode *prilagajanja frekvenčnega odziva*:
			- Iscemo diskretni sistem, ki ima podoben frekvencni odziv, kot zvezni
			- Metoda prvih diferenc, metoda zadnjih diferenc, Tustinovo pravilo, metoda predkrivljenja frekvenc
		- Metode *prilagajanja časovnega odziva*
			-  Iscemo diskretni sistem, ki ima v trenutkih vzorcenja enak odziv kot zvezni sistem
			- metodi stopnicne in pulzne invariance
		- Metode *ekvivalence z zadrževalnikom*
			- Iscemo diskretni sistem, ki se obnasa enako, kot zvezni sistem, ki mu med trenutki vzorcenja *zadrzujemo vrednost vhodnega signala*
			- Ta metoda je ekvivalentna metodi stopnicne invariance
		- Metode *preslikav polov in nicel*
			- Pretvorimo zvezne pole $p_i$ in nicle $z_i$ v diskretne pole $\pi_i$ in nicle $\zeta_i$, po enacbi$$\begin{gather}\pi_i = e^{p_i T} \\ \zeta_i = e^{z_i T}\end{gather}$$
			- Zvezne nicle, ki se _nahajajo v neskoncnosti_, premaknemo v tocko $z=-1$, _razen ene_, saj bi sicer sistem imel direktno povezavo vhoda na izhod

33.  Katero metodo za diskretizacijo zveznih sistemov izbrati, če diskretiziramo zvezni proces? Katero pa izbrati, če diskretiziramo zvezni regulator?
	- Ce diskretiziramo _zvezni PROCES_, navadno izberemo metodo *stopnicne invariance*, ali metoda _ekvivalence z zadrževalnikom_, saj je zadrzevalno vezje na vhodu procesa _dober model realnega D/A pretvornika_
	- Ce diskretiziramo _digitalni filter ali  regulator_ izberemo eno izmed metod _prilagajanja frekvencnega odziva_

34. Naštejte in zelo na kratko opišite štiri metode prilagajanja frekvenčnega odziva, ki smo jih obravnavali
	 - Metoda prvih diferenc $$s \approx \frac{z-1}{T}$$
		 - Odvod izracunamo _"iz prihodnosti"_
	 - metoda zadnjih diferenc $$s \approx \frac{z-1}{T \cdot z}$$
		 - Odvod izvira _"iz preteklosti"_
	 - Tustinovo pravilo $$s \approx \frac{2}{T}\frac{z-1}{z+1}$$
		 - Po obliki znano tudi kot _bilinearna transformacija_
	 - metoda predkrivljenja frekvenc

35. Preslikava področja stabilnih polov ter posledično povezava med stabilnostjo zveznega in diskretiziranega sistema za naslednje metode: metoda prvih diferenc, metoda zadnjih diferenc, Tustinovo pravilo
	- Stabilni poli zveznega sistema se _nahajajo v levi polravnini $s$ ravnine_
	- Za metodo diskretizacije je dobra lastnost to, da se _stabilni zvezni sistem preslika v stabilni diskretni sistem_ in, da se _nestabilni zvezni sistem preslika v nestabilni ddiskretni sistem_
	- Od dobre metode diskretizacije pricakujemo, da se bo _leva polravnina $s$ ravnine preslikala v notranjost enotske kriznice v $z$ ravnini_
	![[Pasted image 20250210185813.png]]
	Stabilna polravnina _zveznega sistema_
	- Metoda _prvih diferenc:_ ![[Pasted image 20250210185915.png]]
	- Metoda _zadnjih diferenc:_ ![[Pasted image 20250210185942.png]]
	- _Tustinovo pravilo:_ ![[Pasted image 20250210190007.png]]
	- Iz zgornjih grafov je razvidno, da je __Tustinovo pravilo najboljsa metoda diskretizacije__

36. Pojav izkrivljenja frekvenc
	-  V postopku diskretizacije zveznega sistema *pride do popačenja frekvenčnega odziva,* ko se diskretni sistem *pri določeni frekvenci w , obnaša enako kot zvezni sistem pri neki višji frekvenci* $$\mathcal{H}(\omega) = \mathcal{H}_z(\frac{2}{T}\tan \frac{\omega T}{2})$$
	- Vgornja enacba pravi, da ima _diskretni sistem pri frekvenci $\omega$ enak odziv, kot zvezni sistem pri frekvenci $\frac{2}{T}\tan \frac{\omega T}{2}$_
	- Dokler so frekvence $\omega$ _veliko nizje od Nyquistove frekvence $\frac{\omega_s}{2}$_, so popacenja relativno majhna, ko pa se frekvenca priblizuje Nyquistovi, popacenja drasticno narastejo
	![[Pasted image 20250210190949.png]]

37. Metoda predkrivljenja frekvenc
	- Pri nacrtovanju digitalnih filtrov zelimo _ujemanje frekvencnih odzivov zveznega in diskretnega sistema pri poljubni frekvenci $\omega_r$_ (obicajno pri mejni frekvenci filtra)
	- V tem primeru pomnozimo _rumeno funkcijo s [[Pasted image 20250210190949.png|prejsnje slike]]_  pomnozimo s konstanto $C$, tako, da se seka z _modro funkcijo_, pri zeljeni fekvenci $\omega_r$ , tako dobimo _magenta funkcijo_: $$C \tan \frac{\omega T}{2}$$
	- Konstanto $C$ dolocimo po naslednji formuli: $$C = \omega_r \cot \frac{\omega_r T}{2} = \omega_r \cot \frac{\pi f_s}{f_s}$$
	- In s tem prisli do splosne enacbe _bilinearne transformacije:_ $$H(z) = G_z(s)\bigg\rvert_{s=C\frac{z-1}{z+1}}$$
	- S to metodo _iznicimo pojav izkrivljenja frekvenc pri izbrani nenicelni frekvenci_

38. Metoda stopnične invariance. Nadomestna shema kakšne analogne vezave je dobljeni diskretni sistem?
	- Z metodo stopnicne invariance, dobimo diskretni odziv tako, da _izenacimo vrednosti odzivov v trenutkih vzorcenja_ $$y^s(k) = y_z^s(t)\bigg\rvert_{t = kT}$$
	- Kjer $y_z^s(t)$ predstavlja stopnicni odziv _zveznega sistema_, $y^s(k)$ pa stopnicni odziv _diskretnega sistema_
	- Metoda stopnicne invariance se v praksi uporablja za diskretizacijo _zveznih sistemov, ki imajo na vhodu D/A pretvornik ali ZOH_
	- Ce imamo zvezni istem, ki ima na vhodu ZOH in na izhodu vzorcevalno vezje, je namrec ta sistem _ekvivalenten diskretnemu sistemu, ki je bil pridobljen z metodo stopnicne invariance_

39. Ali se vsi stabilni zvezni sistemi pri diskretizaciji preslikajo v stabilne diskretne sisteme? Ali se vsi nestabilni zvezni sistemi pri diskretizaciji preslikajo v nestabilne diskretne sisteme?
	- Pri vseh metodah diskretizacije ostane _stevilo polov nespremenjeno_, vendar se njihov polozaj razlikuje glede na metodo
	- Tustinovo pravilo _ohranja stabilnosti izvornega sistema_, torej se nestabilen sistem preslika v nestabilnega, stabilen pa v stabilnega
	- Metoda _prvih diferenc ne ohranja stabilnosti sistema_, poli se preslikajo po enacbi: $\pi_i = e^{p_i T}$
	- Metoda _zadnjih diferenc_ preslika _stabilne pole v stabilne pole_, vendar _lahko preslika tudi nestabilne pole zveznega sistema v stabilne pole diskretnega_
	- Pri metodi _stopnicne invariance_ se _ohranja stabilnost izvornega sistema_

40.  Kaj lahko povemo o povezavi med ničlami zveznega sistema in ničlami pripadajočega diskretiziranega sistema?
	- Samo pri *metodi prvih diferenc se ohranja število ničel*.
	- *Položaj ničel* zveznega sistema je *predvidljiv le pri metodah prilagajanja frekvenčnega odziva*,
	- pri metodi *stopnične invariance položaj ničel praktično nepredvidljiv*.

41. Kateri pogoji morajo biti izpolnjeni, da sistem digitalnega vodenja (z regulatorjem v direktni veji) nima pogreška v ustaljenem stanju
	a)  če se na izhodu procesa pojavi stopničasta motnja,
	b) če se na vhodu procesa pojavi stopničasta motnja,
	c) če nastopi stopničasta sprememba referenčnega signala?
	- Ob __motnji na izhodu procesa:__ Regulacijski sistem je lahko brez motnje v ustaljenem stanju tudi, ce je proporcionalen, vendar mora veljati, _da ima proces pol pri $z=1$_
	- Ob __motnji na vhodu procesa:__ Regulacijski sistem je brez pogreska v ustaljenem stanju, ce velja: $$\lim_{z \rightarrow 1}G_R(z) = 0$$torej: Prenosna funkcija regulatorja,_limitira proti $0$, ko $z$ limitira proti $1$_
	- Ob __stopnicasti spremembi reference:__ Regulacijksi sistem je brez pogreska v ustaljenem stanju, ce velja: $$\lim_{z \rightarrow 1} G_R(z) G_P(z) = \infty$$torej: Produkt prenosnih funkcij _regulatorja_ in _procesa_ _limitirata proti $\infty$m ko $z$ limitira proti $1$_

42. Diskretni proporcionalno-integrirno-diferencirni regulatorji (PID). Pretvorba parametrov iz zveznega regulatorja PID.
	- Enacba zveznega PID regulatorja: $$u_z(t) = K_P\left[e_z(t) + \frac{1}{T_I} \int_0^t e(\tau) \,d\tau + T_D \frac{\,de_z(t)}{\,dt} \right]$$
	- *Diskretni algoritem PID lahko smiselno izpeljemo* iz ustreznega zveznega regulacijskega algoritma, saj s tem *za manjše čase vzorčenja uporabimo vse izkušnje, razna pravila in tabele za nastavljanje parametrov zveznega algoritma PID*.
	- Za majhne case vzorcenja $T$, lahko zvezno diferencialno enacbo PID regulatorja _pretvorimo v diiferencno obliko_, kar lahko storimo na razlicne nacine:
		- _Ad hoc metoda_: Na najenostavnejsi nacin *diskretiziramo posebej odvod in posebej integral*, **odvod zamenjamo z diferencnim kvocientom, integral pa nadomestimo z vsoto** $$u(k) = K_P\left[e(k) + \frac{1}{T_I} \sum_{i-0}^{k-1}e(i)T + \frac{T_D}{T}[e(k)-e(k-1)] \right]$$
		- Za programiranje na digitalnih racunalnikih je najboljsa metoda _rekurzivna oblika algoritma_, kjer racunamo _trenutno vrednost signala iz pretekle ter iz preteklih in sedanje vrednosti napake_ $$u(k-1) = K_P\left[e(k-1) + \frac{1}{T_I} \sum_{i-0}^{k-2}e(i)T + \frac{T_D}{T}[e(k-1)-e(k-2)] \right]$$
		- Rekurzivni PID algoritam se glasi: $$u(k) = u(k-1) + q_0e(k)+q_1e(k-1)+q_2e(k-2)$$ kjer vrednosti _parametrov $q_0, q_1, q_2$ izracunamo s pomocjo naslednjih enacb_ $$\begin{gather}q_0 = K_p(1+\frac{T_D}{T}) \\ q_1 = -K_P(1+\frac{2T_D}{T}-\frac{T}{T_I}) \\ q_2 = K_P \frac{T_D}{T}\end{gather}$$

43. Relacije med parametri tipičnega diskretnega regulatorja PID
	- Relacije med parametri $q_0, q_1, q_2$ dolocimo tako, da _ima diskretni regulatorsk isistem pri krajsih casih vzorcenja podoben odziv na stopnicasti signal pogreska, kot ga ima tipicen zvezni PID regulator_
	![[Pasted image 20250210205104.png]]
	![[Pasted image 20250210205125.png]]

44. Modificirani diskretni PID-algoritmi
	- Za doseganje razlicnih ciljev obstajajo modificirane verzije diskretnega PID algoritma
	- Ce zelimo _zadusiti velike regulirne signale pri hitrih spremembah reference_, nehamo upostevati referenco $w$ pri diferenciranju $e(k) = y(k)-w(k)$ $$u(k) = K_P\left[e(k) + \frac{1}{T_I} \sum_{i-0}^{k-1}e(i)T + \frac{T_D}{T}[-y(k)+y(k-1)] \right]$$
	- Ce zelimo _se bolj zadusiti regulirne vrednosti_, zacnemo pogresek upostevati le se pri _integrirnem clenu_ $$u(k) = K_P\left[-y(k) + \frac{1}{T_I} \sum_{i-0}^{k-1}e(i)T + \frac{T_D}{T}[-y(k)+y(k-1)] \right]$$

45. Vodljivost diskretnih sistemov
	- Diskretni dinamicni sistem je vodljiv, ce _ga lahko pripeljemo s pomocjo koncnega zaporedja vhodnega signala $u(k)$, iz poljubnega zacetnega stanja $x(0)$ v poljubno koncno stanje $x(N)$_ $$x(N) = \mathbf{A}^N x(0) + \mathbf{Q_{V}}_N \cdot \mathbf{u}_N$$
	- Sistem je vodljiv, ce velja: $$\begin{gather}\mathbf{Q_V} = \begin{bmatrix}\mathbf{b}  & \mathbf{Ab} & \cdots & \mathbf{A^{N-1}b} \end{bmatrix} \\ \det \mathbf{Q_V} \neq 0 \end{gather}$$

46. Spoznavnost diskretnih sistemov
	- Diskretni dinamični sistem z izhodom $y(k)$ je *spoznaven, če lahko določimo poljubno stanje sistema $x(k)$ v trenutku $k = 0$, torej $x(0)$, iz končnega zaporedja izhodnega signala $y(0), y(1), ..., y(N − 1)$.* $$x(0) = \mathbf{Q_S}_N^{-1} [\mathbf{y}_N - \mathbf{F}_n \mathbf{u}_N]$$
	- Sistem je spoznave, ce velja: $$\begin{gather}\det \mathbf{Q_S} \neq 0 \\ \mathbf{Q_S}_N = \begin{bmatrix}\mathbf{C^T} \\ \mathbf{C^T A} \\ \vdots \\ \mathbf{C^T A^{N-1}} \end{bmatrix} \\\mathbf{F}_N = \begin{bmatrix} 0 & 0 & \cdots & 0 & d \\ 0 & 0 & \cdots & d & \mathbf{c}^T \mathbf{b} \\ \vdots & \vdots & \ddots & \vdots & \vdots \\ 0 & d & \cdots & \mathbf{c}^T A^{N-4} \mathbf{b} & \mathbf{c}^T A^{N-3} \mathbf{b} \\ d & \mathbf{c}^T \mathbf{b} & \cdots & \mathbf{c}^T A^{N-3} \mathbf{b} & \mathbf{c}^T A^{N-2} \mathbf{b} \end{bmatrix} \end{gather}$$

47. Kdaj pravimo, da sta dva sistema ekvivalentna?
	- Za dva sistema, zapisana v prostoru stanj, pravimo, da *sta ekvivalentna, če se po vhodno-izhodnem obnašanju ne ločita med seboj*.
	- Obstaja _neskoncno ekvivalentnih sistemov dolocenega diskretnega dinamicnega sistema_
	- Zanimajo nas linearne preslikave med vektorji stanj teh sistemov $$\mathbf{x} = \mathbf{Tx_t}$$ kjer je $\mathbf{x}$ vektor stanj izhodiscnega sistema, $\mathbf{x}_t$ vektor stanj ekvivalentnega sistema in $\mathbf{T}$ nesingularna kvadratna matrika dimenzije $\infty$
	- Transformirani sistem zapisemo s pomocjo naslednjih konverzij $$\begin{gather}\mathbf{A}_t = \mathbf{T^{-1}AT} && \mathbf{b}_t = \mathbf{T^{-1}b} && \mathbf{C^T}_t = \mathbf{C^T T} && d_t=d  \end{gather}$$ 

48. Diagonalna kanonična oblika zapisa sistema v prostoru stanj
	- Diagonalna kanonična oblika je oblika zapisa, pri kateri je *sistemska matrika diagonalna*, kar pomeni, da *med stanji ni nobene interakcije*. *Predikcija določenega stanja je namreč odvisna le od trenutne vrednosti tega stanja in trenutne vrednosti vhoda*.
	- Transformacijsko matriko za diagonalno kanonicno obliko dobimo z _iskanjem lastnih vrednosti in lastnih vektorjev sistemske matrike $\mathbf{A}$_, to so tisti, ki resijo enacbo: $$\begin{gather}\mathbf{A\Theta_i} = \lambda_i\mathbf{\Theta_i} \\ \mathbf{A \Theta} = \mathbf{\Theta \Lambda}\end{gather}$$
	- Ce zgornjo enacbo _premultipliciramo s_ $\mathbf{\Theta^{-1}}$ , dobimo: $$\mathbf{\Lambda = \Theta^{-1}A\Theta} = \begin{bmatrix}\lambda_1 & 0 & \cdots & 0 \\ 0 & \lambda_2 & \ddots & \vdots \\ \vdots & \ddots & \ddots & 0 \\ 0 & \cdots & 0 & \lambda_n\end{bmatrix}$$
	- Iskana _transformacijska matrika $\mathbf{\Theta}$_ je torej __matrika lastnih vektorjev sistemske matrike__
	- _Stevilo vodljivih stanj sistema lahko dolocimo kot stevilo nenicelnih elementov v vhodnem vektorju $\mathbf{b_d}$ zapisa v diagonalni kanonicni obliki_
	- _Lahko ugotovimo spoznavnost sistema, ce je v izhodiscnem vektorju $\mathbf{C_d^T}$ katerikoli element enak $0$_, kar pomeni, da pripadajoce stanje nima vpliva na izhod

49. Vodljivostna regulatorska kanonična oblika zapisa sistema v prostoru stanj
	- Sistemska matrika $A_v$ ima _Frobeniusovo obliko, v zadnji vrstici matrike so koeficienti karakteristicnega polinoma_ $$\begin{gather}x(k+1) = \mathbf{A}x(k) + \mathbf{b}u(k) \\ \vdots \\\begin{bmatrix} x_1(k+1) \\ x_2(k+1) \\ \vdots \\ x_{n-1}(k+1) \\ x_n(k+1) \end{bmatrix} = \begin{bmatrix} 0 & 1 & 0 & \cdots & 0 \\ 0 & 0 & 1 & \cdots & 0 \\ \vdots & \vdots & \vdots & \ddots & \vdots \\ 0 & 0 & 0 & \cdots & 1 \\ -a_n & -a_{n-1} & -a_{n-2} & \cdots & -a_1 \end{bmatrix} \begin{bmatrix} x_1(k) \\ x_2(k) \\ \vdots \\ x_{n-1}(k) \\ x_n(k) \end{bmatrix} + \begin{bmatrix} 0 \\ 0 \\ \vdots \\ 0 \\ 1 \end{bmatrix} u(k)\end{gather}$$
	- Za transformacijo v VRKO potrebujemo transformacijsko matriko $\mathbf{T}_v = \mathbf{Q_v W}$, matriko $\mathbf{W}$ sestavimo iz _koeficientov karakteristicnega polinoma sistema_ $$\mathbf{W} = \begin{bmatrix} a_{n-1} & a_{n-2} & \cdots & a_1 & 1 \\ a_{n-2} & a_{n-3} & \cdots & 1 & 0 \\ \vdots & \vdots & \ddots & \vdots & \vdots \\ a_1 & 1 & \cdots & 0 & 0 \\ 1 & 0 & \cdots & 0 & 0 \end{bmatrix}$$

50. Spoznavnostna observatorska kanonična oblika zapisa sistema v prostoru stanj
	- Oblika je primerna za _nacrtovanje opazovalnikov_, zapis enacbe stanj v tej obliki se glasi: $$\begin{gather}x(k+1) = \mathbf{A}x(k) + \mathbf{b}u(k) \\ \vdots \\ \begin{bmatrix} x_1(k+1) \\ x_2(k+1) \\ x_3(k+1) \\ \vdots \\ x_n(k+1) \end{bmatrix} = \begin{bmatrix} 0 & 0 & \cdots & 0 & -a_n \\ 1 & 0 & \cdots & 0 & -a_{n-1} \\ 0 & 1 & \cdots & 0 & -a_{n-2} \\ \vdots & \vdots & \ddots & \vdots & \vdots \\ 0 & 0 & \cdots & 1 & -a_1 \end{bmatrix} \begin{bmatrix} x_1(k) \\ x_2(k) \\ x_3(k) \\ \vdots \\ x_n(k) \end{bmatrix} + \begin{bmatrix} b_n - b_0 a_n \\ b_{n-1} - b_0 a_{n-1} \\ b_{n-2} - b_0 a_{n-2} \\ \vdots \\ b_1 - b_0 a_1 \end{bmatrix} u(k) \end{gather}$$
	- Sistemskamatrika $\mathbf{A_s}$ ima _transponirano Frobeniusovo obliko_, izhodni vektor $\mathbf{C^T}$ ima _enostavno obliko_
	- Sistemski matriki $\mathbf{A}_s$ in $\mathbf{A}_v$ (VRKO) sta med seboj _transponirani_
	- Za konverzijo sistema v SOKO, potrebujemo _transformacijsko matriko_ $\mathbf{T_s} = (\mathbf{WQ_s}^{-1})$, kjer matriko $\mathbf{W}$ oblikujemo enako, kot pri VRKO

51. Osnovni regulator stanj in načrtovanje z metodo premikanja polov
	- O __osnovnem regulatorju stanj__ govorimo, ko _uporabljamo le stanja sistema_, brez kakrsnihkoli opazovalnikov ali kompenzacij
	- Lego polov povratnozančnega sistema določimo z *rešitvijo karakteristične enačbe povratnozančnega sistema* pri znanem ojačenju regulatorja stanj $$\det(z\mathbf{I}-\mathbf{A}+\mathbf{bk^T}) = 0$$
	- Iz enacbe je rezvidno, da _s spreminjanjem povratnozancne matrike  $\mathbf{k^T}$ spreminjamo pole sistema_
	- Pri nacrtovanju zelimo izbrati ojacanje $\mathbf{k^T}$ tako, da bojo _povratnozancni poli lezali na zelenih lokacijah_
	- Problem je enostaven, ko je sistem podan v obliki VRKO, proces lahko opisemo z enacbo stanj: $$\mathbf{x}_v(k+1) = \begin{bmatrix} 0 & 1 & 0 & \cdots & 0 \\ 0 & 0 & 1 & \cdots & 0 \\ \vdots & \vdots & \vdots & \ddots & \vdots \\ 0 & 0 & 0 & \cdots & 1 \\ -a_n & -a_{n-1} & -a_{n-2} & \cdots & -a_1 \end{bmatrix} \mathbf{x}_v(k) + \begin{bmatrix} 0 \\ 0 \\ \vdots \\ 0 \\ 1 \end{bmatrix} u(k)$$ Ker regulator stanj _regulirno velicino racuna iz vektorja stanj_, bomo tudi pripadajoce ojacanje regulatorja ozvacili z indeksom $v$ in poudarili da gre za regulator stanj v VRKO $$u(k) = \mathbf{-k^T}_v\mathbf{x}_v(k) = -[k_{v1}\space k_{v2} \space \cdots \space k_{vn}]\mathbf{x_v}(k)$$
	![[Pasted image 20250211014758.png]]

52. Optimalni regulator stanj, linearni kvadratični regulator
	- Optimalni regulator je _regulator, ki je načrtovan z minimizacijo kriterijske funkcije_
	- Dolocimo regulator stanj, ki generira iz _vektorja stanj tako regulirno velicino, ki sistem pripelje iz zacetnega v koncno stanje in pri tem_ __minimizira naslednjo kriterijsko fukcijo:__ $$J = \frac{1}{2}\sum_{k=0}^N[\mathbf{x}^T(k)\mathbf{Qx}(k) + \mathbf{u}^T(k)\mathbf{Ru}(k)]$$ kjer je:
		- $\mathbf{Q}$ pozitivno semidefinitna ($\mathbf{x^T Qx} \geq 0$ za poljubni x) in simetricna ($\mathbf{Q=Q^T}$) matrika
		- $\mathbf{R}$ pozitivno definitna ($\mathbf{x^T Rx \geq 0}$, za poljubni $x\neq 0$) in simetricna ($\mathbf{R=R^T}$) matrika
	- Resitev je _regulator s casovno spremenljivim ojacanjem_
	- Ce pustimo, da v kriterijski funkciji $N$ limitira proti neskoncnosti, dobimo _casovno neodvisen regulator_, oziroma __linearni kvadraticni regulator__ s kratico $LQR$ $$\mathbf{u}(k) = -\mathbf{Kx}(k)$$

53. Luenbergerjev opazovalnik stanj in njegovo načrtovanje
	- Za izvedbo regulatorja morajo biti _merljiva vsa stanja procesa_, kar je posebej pri procesih visjega reda dokaj omejujoce. V velikih primerih bi sama meritev stanja _predstavljala motnjo v procesu_
	- Ce nimamo meritev stanja, jih lahko _ocenimo na podalgi ostalih spremenljivk_ procesa. Ce je _proces spoznaven je mogoce rekonstruirati stanja sistema_
	- Ker nekateri izhodi predstavljajo tudi stanja, le-teh _ni treba ocenjevati_
	- __Luenbergerjev opazovalnik stanj__ odpravlja pomanjkljivosti odprtozancnega opazovalnika, pri katerem _nimamo vpliva na dinamiko spreminjanja pogreska ocene stanj_
	- Ideja Luenbergerjevega opazovalnika je, da za oceno parametrov _poleg vhodnega signala $u(k)$ upostevamo tudi merjeni izhod $y(k)$, ki ga definira izhodna enacba sistema $y(k)  = \mathbf{C^T x}(k)$_, kjer smo predpostavili da je _vhodno-izhodna konstanta_ $d$ enaka $0$ 
	- Na podoben nacin lahko definiramo tudi _oceno izhodnega signala procesa_ (oznacena z $^*$) $$y^* = \mathbf{C^T x}^*(k)$$
	- Izhodni pogresek $y(k) - y^*(k)$ vsebuje _dodatno informacijo o pogresku ocene stanj_, zato ga je smiselno upostevati pri _popravku ocene stanj_, kar pomeni, da enacbi odprtozancnega ocenjevalnika dodamo se *popravek zaradi izhodnega pogreska* $$\begin{gather}\mathbf{x}^*(k+1) = \mathbf{Ax}^*(k) + \mathbf{b}u(k) + \mathbf{h}[y(k) - y^*(k)] = \\ = \mathbf{Ax}^*(k) + \mathbf{b}u(k) + \mathbf{h}[\mathbf{c^T}x(k) - \mathbf{c^T}x^*(k)] =  \\ =\mathbf{Ax}^*(k) + \mathbf{b}u(k) + \mathbf{hc^T}[x(k) - x^*(k)] = \\ = \mathbf{Ax}^*(k) + \mathbf{b}u(k) + \mathbf{hc^T}\tilde{x}(k) \end{gather}$$
	- Za dolocitev vektorja $\mathbf{h}$ uporabimo enako metodo, kot za dolocitev $\mathbf{k^T}$ pri regulatorju stanj

54. Trenutni opazovalnik stanj. Povezava z Luenbergerjevim opazovalnikom stanj.
	- Luenbergerjev opazovalnik stanj vcasih imenujemo tudi _napovedni opazovalnik_, kar izhaja iz dejstva, da _za oceno trenutnega stanja uporabimo le pretekle meritve_
	- Ker imamo tudi v trenutku $k$ na voljo meritev se jo zdi smiselno upostevati pri _oceni trenutnega stanja_, to naredimo tako, da _pogresek zaradi netocno napovedane ocene $(y(k)-\mathbf{c^T x}^*(k))$_ upostevamo pri izracunu trenutne ocene $$\tilde{\mathbf{x}}(k) = \mathbf{x}^* (k) + 1(y(k) - \mathbf{c^T x}^*(k))$$ pri cemer je $1$ _ojacanje trenutnega opazovalnika_, vektor $\tilde{\mathbf{x}}(k)$ pa imenujemo _trenutna ocena stanj_. Napovedano oceno v naslednjem trenutku vzorcenja izracunamo iz trenutne ocene v tekocem trenutku z upostevanjem enacbe: $$\mathbf{x^*}(k+1) = \mathbf{A\tilde{x}}(k) + \mathbf{b}u(k)$$
	- Za razliko od Luenbergerjevega opazovalnika, _ni vec eksplicitno prisoten korekcijski clen_, vendar je korekcija zdaj _prisotna pri izracunu trenutne ocene_

55. Regulator stanj na osnovi opazovalnika stanj
	- Za realizacijo regulatorja stanj moramo imeti _merljiva vsa stanja procesa_, ce to ni mozno, uporabimo za nemerljiva stanja _oceno stanj iz opazovalnika_. 
	- Zdruzimo enacbi za predikcijo stanja procesa in enacbo za predikcijo pogreska ocene stanj, v _naslednjo matricno enacbo:_$$\begin{bmatrix}\mathbf{x}(k+1) \\ \tilde{\mathbf{x}}(k+1) \end{bmatrix} = \begin{bmatrix}\mathbf{A-bk^T} && \mathbf{bk^T} \\ 0 && \mathbf{A-hc^T}\end{bmatrix} \cdot \begin{bmatrix}\mathbf{\mathbf{x}(k)} \\\mathbf{\tilde{x}}(k)\end{bmatrix}$$to je _enacba stanj celotnega povratnozancnega sistema_, njegove pole dolocimo, ce dolocimo lastne vrednosti matrike v enacbi. 
	 - Poiscemo torej _karakteristicni polinom povratnozancnega sistema_ $$\det \left\{ z\mathbf{I} - \begin{bmatrix} \mathbf{A} - \mathbf{b} \mathbf{k}^T & \mathbf{b} \mathbf{k}^T \\ 0 & \mathbf{A} - h \mathbf{c}^T \end{bmatrix} \right\} = \det \begin{bmatrix} z\mathbf{I} - \mathbf{A} + \mathbf{b} \mathbf{k}^T & -\mathbf{b} \mathbf{k}^T \\ 0 & z\mathbf{I} - \mathbf{A} + h \mathbf{c}^T \end{bmatrix}$$
	
	- Glede na zgornjo enacbo, je _karakteristicni polinom povratnozancnega sistema enak:_ $$\det \left\{ z\mathbf{I} - \begin{bmatrix} \mathbf{A} - \mathbf{b} \mathbf{k}^T & \mathbf{b} \mathbf{k}^T \\ 0 & \mathbf{A} - h \mathbf{c}^T \end{bmatrix} \right\} = \det (z\mathbf{I} - \mathbf{A} + \mathbf{b} \mathbf{k}^T) \det (z\mathbf{I} - \mathbf{A} + h \mathbf{c}^T)$$
	- Poli zaprtozancnega sistema so _unija polov regulatorja stanj in opazovalnka_. torej 
		- Z regulatorjem ne pokvarimo opazovalnika
		- Z opazovalnikom ne pokvarimo regulatorja
		- Ta lastnosti je _poseben primer principa locitve_, ki velja samo v primeru _linearnih sistemov_
	![[Pasted image 20250211160505.png]]

56.  Algoritem kalmanovega filtra
	- Kalmanov filter je _dualen_ optimalnemu opazovalniku stanj, ki _na osnovi posumljenih meritev proizvede zaporedje optimalnih ocenjenih vektorjev stanja_
	- Ojacanje opazovalnika se sproti spreminja, s cimer dosezemo omenjeno optimalnost
	- Predpostavljamo, da je _vektor stanj moten z Gaussovim sumom_ (clen $\mathbf{Fv}(k)$ v naslednji enacbi stanj): $$\mathbf{x}(k+1) = \mathbf{Ax}(k) + \mathbf{bu}(k)+\mathbf{Fv}(k)$$
	- Sumov ne moremo meriti, vendar poznamo njihove _statisticne lastnosti_. Procesni sum ima nicelno srednjo vrednosti
	- __Algoritem Kalmanovega filtra:__
		1. Na osnovi pretekle trenutne ocene vektorja stanj ($\mathbf{\tilde{x}}(k-1)$) dolocimo napovedano oceno vektorja stanj ($\mathbf{x}^*(k)$) $$\mathbf{x}^*(k) = \mathbf{A\tilde{x}}(k-1) + \mathbf{Bu}(k-1)$$ ta korak si lahko pripravimo vnaprej, medtem ko cakamo na meritve ob trenutku $k$
		2. Na osnovi kovariancne matrike ($\mathbb{E}[\mathbf{v}(k)\mathbf{v^T}(k)] = \mathbf{N}$) pogreske trenutne ovene $\mathbf{P}(k-1)$ tvorimo kovariancno matriko pogreska napovedane ocene $\mathbf{P}^*(k)$ $$\mathbf{P}^*(k) = \mathbf{A} \hat{\mathbf{P}}(k-1) \mathbf{A}^T + \mathbf{F} \mathbf{V} \mathbf{F}^T$$
		3. Na osnovi kovariancne matrike pogreska napovedane ocene $\mathbf{P}^*(k)$ dolocimo ojacanje $\mathbf{L}(k)$, ki ga imenujemo tudi _kalmanovo ojacanje_ $$\mathbf{L}(k) = \mathbf{P}^*(k) \mathbf{C}^T \left[ \mathbf{C} \mathbf{P}^*(k) \mathbf{C}^T + \mathbf{N} \right]^{-1}$$
		4. Ko dobimo meritev izhoda $y(k)$, lahko dolocimo trenutno oceno stanj $\mathbf{\hat{x}}(k)$ $$\hat{\mathbf{x}}(k) = \mathbf{x}^*(k) + \mathbf{L}(k) \left[ \mathbf{y}(k) - \mathbf{C} \mathbf{x}^*(k) \right]$$
		5. V zadnjem koraku izracunamo kovariancno matriko vektorja trenutnega pogreska $\mathbf{P}(k)$ na osnovi kovariancne matrike vektorja napovedanega pogreska $\mathbf{P}^*(k)$ $$\hat{\mathbf{P}}(k) = \mathbf{P}^*(k) - \mathbf{L}(k) \mathbf{C} \mathbf{P}^*(k)$$

57. Stacionarni Kalmanov filter
	- V praksi je zanimiva rešitev *Kalmanovega filtra v ustaljenem stanju* ($k \rightarrow \infty$). Matrika $\mathbf{L}$ postane konstantna in ima naslednjo obliko: $$\mathbf{L} = \overline{\mathbf{P}}^* \mathbf{C}^T \left( \mathbf{C} \overline{\mathbf{P}}^* \mathbf{C}^T + \mathbf{N} \right)^{-1}$$
	- Pri stacionarnem Kalmanovem filtru je _kalmanovo ojacanje konstantno_

58. Princip dualnosti med regulatorjem stanj in opazovalnikom
	- Pri optimalnem regulatorju stanj ustreza utežnostna matrika $R$ vektorja $u$ kovariančni matriki šuma na izhodu Kalmanovega filtra $N$
	- Matrika $\mathbf{Q}$ ustreza _kovariancni matriki suma na stanja_ $\mathbf{FVF^T}$
	
| Regulator stanj | Kalmanov filter  |
| :-------------: | :--------------: |
|  $\mathbf{A}$   |  $\mathbf{A^T}$  |
|  $\mathbf{B}$   |  $\mathbf{C^T}$  |
|  $\mathbf{b}$   |   $\mathbf{c}$   |
|  $\mathbf{K}$   |  $\mathbf{H^T}$  |
|  $\mathbf{R}$   |   $\mathbf{N}$   |
|  $\mathbf{Q}$   | $\mathbf{FVF^T}$ |
	