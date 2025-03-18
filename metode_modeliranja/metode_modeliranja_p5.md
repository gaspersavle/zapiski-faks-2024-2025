### Mehanski sistemi - linearizacija

__Nelinearni model dvigala z bremenom s predavanja [[motode_modeliranja_p4]]__
$$\begin{gather}
	(m_1+m_2)\ddot x - m_2lsin(\phi)\dot \phi^2+m_2lcos(\phi) = F(t) \\
	m_2 \ddot x l cos(\phi) + m_2 l^2\ddot \phi + m_2 g l sin(\phi) = 0
\end{gather}$$

Linearizacijo lahko izvedemo na vec nacinov:
1. Aproksimacija nelinearnih clenov z linearnimi
2. Linearizacija s pomocjo taylorjeve vrste
3. Uporaba namenskih linearizacijskih funkcij (linmod)

#### 1. Aproksimacija nelinearnih clenov z linearnimi
_Katere nelinearne clene lahko v tem primeru nadomestimo z linearnimi?_
- Upostevamo predpostavko, da je kot odmika bremena $m_2$ iz ravnovesnega polozaja majhen, kar pomeni, da priblizno velja:
$$\begin{gather} sin(\phi) \approx \phi \\
cos(\phi) \approx 1 \\
\phi \cdot \dot \phi^2 \approx 0
\end{gather}$$
Linearizirana enacba je torej:
$$\begin{gather}
	(m_1+m_2)\ddot x - m_2l\phi\dot \phi^2+m_2l = F(t) \\
	m_2 \ddot x l + m_2 l^2\ddot \phi + m_2 g l \phi = 0
\end{gather}$$
Predpostavimo, da pride pri gibanju vozicka med vozickom in podlago do dusenja, ki je premosorazmerno $f_1$ in v tocki vpetja tovora do dusenja, sorazmernega $f_2$, torej velja:
$$
P \neq 0
$$
1. __Kako se spremenijo enacbe nelinearnega in linearnega modela?
2. __Kako to vpliva na lego polov in nicel linearnega modela?__

![[Pasted image 20241112114730.png]]

#### Domaca naloga:
![[Pasted image 20241112114842.png]]
#HOMEWORK 


### Mehanski sistemi - Lagrangeeva enacba
__Primer modeliranja mehanskega sistema (obroc s kroglico - gibanje tekocine)
- Zapisemo matekaticni model za gibanje obroca in kroglice, ki je v njem
- Vhod v sistem predstavlja:
	- Napetost na motorju $U(t)$, s katero povzrocimo navor $T(t)$ in delujemo na vrtenje obroca
- Izhode sistema lahko predstavljajo:
	- Hitrost vrtenja obroca $\omega(t)$
	- Kot obroca $\alpha(t)$
	- Kot odmika kroglice $\phi(t)$

Obroc s kroglico predstavlja sistem z zelo oscilatornimi lastnostmi, ki jih srecamo pri:
- Cestnem ali zelezniskem prevozu tekocin z veliko hitrostjo
- Prevozu nafte s tankerji
- Dogajanju v raketi, ki vsebuje tekoce gorivo
- V gradbenistvu

1. Vhodi in izhodi sistema:
![[Pasted image 20241112115602.png]]
2. Shrematska predstavitev naprave:
![[Pasted image 20241112115631.png]]
3. Nekaj relacij:
	$$\begin{gather}
	y = R(\alpha - \phi) && \phi = \alpha - \frac{y}{R} &&  \alpha = \phi + \frac{y}{R} \\
	y = r\phi && \phi = \frac{y}{r}
	\end{gather}$$
__Modeliranje sistema:__
1. Definiramo se nekaj relacij, ki jih bomo potrbovali za lagrangeevo enacbo:
	- Translacijska hitrost kroglice:
$$v = (R-r)\dot \phi$$
	- Za obroc brez kroglice velja:
$$J_a\ddot \alpha + f_m \dot \alpha = T(t)$$
2. #TODO dopolni s tablice
__Koncni nelinearni model sistema se glasi:__
$$\begin{gather}
[J_a + m(R-r)^2]\ddot \alpha + f_a \dot \alpha - \frac{m(R-r)^2}{R}\ddot y = T(t) - mg(R-r) sin(\alpha- \frac{y}{R}) \\
[]
\end{gather}$$

#TODO dopolni


### Hidravlicni sistemi
__Osnovni pojmi, velicine, zakoni in relacije__
1. Osnovne _velicine_:
	- Visina $h [m]$, volumen $V [m^3]$
	- Pretok $\Phi [kg/s], [m^3/s]$
	- Tlak $p[Pa]$
2. Viri:
	- Crpalke
3. Ravnotezni zakoni so obicajno izpeljani iz splosnih ravnoteznih enacb
$$Vstopajoci\space tok \mapsto Shranjeni \space tok \mapsto Izstopajoci \space tok$$
__Primer modeliranja hidravlicnega sistema:__

- Za sistem na sliki zgradimo matematicni model
	- Nelinearni _univariabilni_ model (UV)
	- Pripadajoci linearizirani model
	- Nelinearni _multivariabilni_ model (MV)
	- Pripadajoci linearizirani model
Pri tem:
- Predpostavimo, da je sistem v ravnoteznem stanju
- Predpostavimo navidezno majhne pretoke iz ravnoteznih stanj
- Oznacimo pretoke
- Uporaimo splosne zapise ravnoteznih enacb
- Po potrebi enacbe uredimo

Zastavimo si nekaj vprasanj:
1. Kako izbrati vhode pri multivariabilnem sistemu, 2 vhoda, 2 izhoda?
2. Kako se spremeni predstavljena interpretacija ob razlicnih nastavitvah ventilov?
3. Kako bi eksperimentalno ovrednotili zgrajeni model?
4. Kako bi pokazali, da gre res za multivariabilni sistem?
#### Primer modeliranja hidravlicnega sistema kot sistem 1. reda:
1. Korak:
	- Pregledamo prirocnik proizvajalca naprave
		- Ugotovimo obmocje vhodnih in izhodnih velicin
			- Izhodi senzorjev visine vode so v obmocju med -10 in +10 voltov
			- Vhodna napetost crpalk je v obmocju med -10 in +10 voltov
		- Ugotovimo dimenzije sistema, ki so pomemebne z vidika modeliranja:
			- Notranji polmer vsakega rezervoarja je 0.07m, kaj pomeni, da je notranji prezni presek vsakega od njih $0.0154m^2$
			- Vsi rezervoarji so visoki priblizno 60 cm
		- Visina vode v rezervoarjih je oznacena na vsakem od njih, tako da je mozno odcitati tudi z opazovanjem
		- Ko visina vode v rezervoarju presexze 60cm, se zaradi varnosti pripadajoca crpalka izklopi
	- Dolocimo funkcionalnost sistema in njegove fizikalne povezave:
		- Crpalki napajata rezervoarja 1 in 3 (vsaka svojega)
		- Vsi rezervoarji so medsebojno povezani preko ventilov
		- Vsak od rezervoarjev ima iztocne ventile
		- Vsakemu ventilu je mogoce nastaviti odprtost med 0 in 100%
		- Visino vode lahko merimo v vsakem rezervoarju posebej
	- Dolocimo kaj v sistemu nas zanima oz kako bomo dani sistem obravnavali
		- Odlocili smo se, da elimo sistem obravnavati kot sistem _1. reda_
	- Zeleno strukturo delovanja dosezemo tako, da zapremo ventila v2 in v3, ventil v6 pa popolnoma odpremo. Enako strukturo bi lahko dosegli, ce bi odprli ventil V3 in zaprli V6
2. Korak: Osredotocimo se na opazovani del sistema, t.j. _3. rezervoar_:
	- Najprj dolocimo _karakteristiko senzorja_ visine vode. V rezervoar natocimo vodo in opazujemo njen nivo, z merjenjem pa tudi pripadajoci izhodni signal v voltih. Rezultate tabeliramo in narisemo, ter tako pridemo do ocene karakteristike senzorja. V konkretnem primeru ima senzor linearno karakteristiko, ki jo lahko spisemo z naslednjo enacbo:
$$x_3(t) = a_{s3} \cdot k_s(t) + b_{s3}$$
		kjer smo konstanti dolocili kot:
		$$\begin{gather}
		a_{s3} = -27.5 [V/m]\\
		b_{s3} = 7.78 [V]
		\end{gather}$$
3. Korak: Osredotocimo se na opazovani del sistema  _3. rezervoar_:
	- Dolocimo karakteristiko crpalke vode (relaciji med napetostjo vzbujanja in pretokom vode)
		- Najprej zapremo vse ventile in natocimo vodo do dolocene 
#todo dopolni


### Hidravlicni sistemi - linearizacija