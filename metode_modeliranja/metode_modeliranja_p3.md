![[metode_modeliranja_p2#Pretvorba diferencialne enacbe v zapis prostora stanj]]
#### Diferencialna enacba vsebuje odvode vhodnega signala

![[Pasted image 20241011102412.png]]


1. Diferencialno enacbo najprej pretvorimo v prenosno funkcijo

$$\begin{gather}y^{(n)}(t) + a_{n-1}y^{(n-1)}(t) + \cdots + a_1 \frac{dy(t)}{dt} + a_0 y(t) = b_n u^{(n)}(t) + b_{n-1} u^{(n-1)}(t) + \cdots + b_1 \frac{du(t)}{dt} + b_0 u(t)
\\ \Downarrow \\
G(s) = \frac{b_n s^n + b_{n-1} s^{n-1} + \cdots + b_1 s + b_0}{s^n + a_{n-1} s^{n-1} + \cdots + a_1 s + a_0}
\end{gather}$$
2. Odpravimo imenovalec 

3. Eksplicitno izrazimo clen z najvisjo potenco $s^n$

4. Celotno enacbo delimo s $s^n$

5. Zdruzimo clene z enako potenco $s^n$

6. Preoblikujemo enacbo _gnezdimo operacijo integriranja_, tako da izpostavimo $\frac{1}{s}$

 7. Vpeljemo nove oznake spremenljivk

8. Na $x_i(s)$ in $u(s)$ naredimo inverzno Laplacovo transformacijo

9.  Zapis pretvorimo v vektorsko-matricno obliko
	- Spremenljivke $x_i(t)$ , ki predstavljajo stanja uredimo v vektor in vse skupaj zapisemo v obliki zapisa prostora stanj


### Pretvorba zapisa v prostoru stanj v zapis s prenosno funkcijo (ali diferencialno enacbo)

#### Primer: Sistem prvega reda

#### Primer: Sistem drugega reda

## Predstavitve matematicnih modelov v matlabu in pripadajocih orodjih
Moznosti predstavitve in implementacije:
- Control system toolbox
- Simulink

Delitev predstavitve modelov:
- Linearni casovno nespremenljivi modeli
- Nelinearni modeli
- Zvezni in diskretni modeli
- UV in MV modeli

Linearno casovno nespremenljive sisteme lahko dolocamo v naslednjih oblikah
- Prenosna funkcija v polinomski obliki
- Prenosna funkcija v faktorizirani obliki
- Prostor stanj
- Frekvencni odziv

Zaradi enostavnejše uporabe CST omogoča določene podatkovne strukture za vsako od naštetih oblik, ki jih imenujemo __objekti__.

Te oblike __objektov LTI__ vključujejo podatke o modelu in omogočajo manipuliranje (računanje, priročno izvajanje transformacij) z modeli kot s posameznimi enotami, namesto da bi morali prenašati zbirke podatkov v obliki vektorjev in matrik

Predstavitev modelov torej temelji na objektno-orientiranih programskih zmožnostih Matlaba. Objekti so strukture Matlaba, ki imajo dodatne značilnosti (zastavice), ki definirajo njihov razred (ang. class). To so npr. tf, zpk, ss in frd za LTI-objekte.

#TODO 


#TODO torkova predavanja : do 3.9

# Lastnosti in analiza linearnih dinamicnih sistemov v frekvencnem prostoru

##  Frekvencna karakteristika dinamicnega sistema

## Frekvencna karakteristika - bodejev diagram

Bodejev diagram je predstavitev frekvencne karakteristike sistema z dvema diagramoma:
1. Logaritem absolutne vrednosti v odvisnost od frekvence:
	$$L(\omega) |dB| = 20log_{10}|G(j\omega)|$$
2. Fazni kot v odvisnosti od frekvence: 
$$\Phi(\omega) = |G(j\omega)| = arctan\frac{Im |G(j\omega)|}{Re|G(j\omega)|}$$
Bodejev diagram za __P sistem 1. reda:__
- Prenosna funkcija sistema P1:
$$G(s) = \frac{K}{Ts+1}$$
- Logratiem absolutne vrednosti in fazni kot (frekvencna karakteristika sistema P1):
$$
L(\omega) = 20 \log \left| \frac{1}{1 + j \omega T} \right| = -20 \log \sqrt{1 + (\omega T)^2}
$$
$$\Phi(\omega) = \arctan \left( \frac{\Im [G(j \omega)]}{\Re [G(j \omega)]} \right) = - \arctan (\omega T)
$$
![[Pasted image 20241018103415.png]]
## Frekvencna karakteristika - Nicholsov diagram

Nicholsov diagram je predstavitev frekvencne karakteristike sistema z enim diagramom

1. Logaritem absolutne vrednosti v odvisnosti od faznega kota:

Nicholsov diagram za __P sistem 1. reda:__
- Prenosna funkcija sistema P1:
$$G(s) = \frac{K}{Ts+1}$$

## Frekvencna karakteristika - Polarni diagram

Je predstavitev frekvencne karakteristike sistema z enim diagramom v kompleksni ravnini:
1. Vsaka tocka na grafu je podana s polarnim zapisom kompleksorja:
$$G(j\omega) = |G(j\omega)|e^{j|G(j\omega)|}$$



## Frekvencna karakteristika - Identifikacija s pomocjo Bodejevega diagrama

1. _Dolocimo vrsto sistema_ s pomocjo naklona $L(\omega)$ pri nizkih frekvencah. Ce je sistema 0 vrste, ima naklon 0 dB/dek, ce je 1. vrste ima naklon -20 dB/dek, ce je 2. vrste ima naklon -40 dB/dek... 
2. Ce se naklon karakteristike $L(\omega)$ spremeni, pomeni, da ima v tisti tocki nek clen lomno frekvenco. Ce se naklon spremeni pri frekvenci 1/T za -20 dB/dek, je prisoten clen $\frac{1}{Ts+1}$, ce se naklon spremeni za +20 dB/dek, je prisoten clen $Ts +1$
3. Sprememba naklona za +/- 40 dB pomeni, da je prisoten _clen 2. reda_. V tem primeru je potrebno določiti, ali gre za clen z dvojnim realnim korenom ($\zeta = 1$), ali za clen s konjugirano kompleksnim parom korenov ($\zeta <1$). Za točno določitev je običajno potrebno narediti dodatne meritve v okolici frekvence, kjer se naklon spremeni za +/- 40 dB (s tem določimo $\zeta$ in $\omega_n$ pri $\zeta <1$)

Določanje prenosne funkcije sistema z uporabo Bodejevega diagrama (primer):
- Sila prikazuje asimptotski potek diagrama algoritme absolutne vrednosti G![[Pasted image 20241018104514.png]]
- Pripadajoča (identificirana) prenosna funkcija je:
$$
G(s) = K \frac{\left( \frac{1}{2}s + 1 \right) \left( \frac{1}{4}s + 1 \right)}{s \left( \frac{1}{8}s + 1 \right) \left( \frac{1}{24}s + 1 \right) \left( \frac{1}{36}s + 1 \right)}

$$

# Podobnosti in razlike pri teoreticnem in kombiniranem modeliranju sistemov
Namen tega sklopa je:
- Spomniti na skupne in razlicne koncepte pri teoreticnem in kombiniranem modeliranju, ki jih uporabljamo na zalo razlicnih podrocjih dela
- Opozoriti na potencialno podobnost rezultatov modeliranja in na posledice, ki so pripeljale do opazovanja problemov na enovit nacin
- Opozoriti na moznosti vpeljave razlicnih predpostavk v postopek modeliranja ali iskanja razlicnih poti resevanja problemov, ki lahko ob enakih poneostavitvenih predpostavkah pirpeljejo do enakih razultatov modeliranja

Kaj je skupnega spodnjim stirim primerom?
![[Pasted image 20241018112848.png]]

1. Elektricno vezje:
$$\begin{gather}
u_0 = u_R + u_C \\
u = u_r + y\\
u_R = i\cdot R = RC \frac{dy}{dt}\\
i = C\frac{du_C}{dt}\\
u = RC\frac{dy}{dt} + y\\
\frac{dy}{dt}+\frac{1}{RC}y = \frac{1}{RC}u
y(0) = u_C(0) = y_0\\
\vdots \\
\dot y + ay = bu ; y(0) = y_0

\end{gather}$$

## Analogije velicin in elementov
1. Dinamicne velicine
	- shranjene velicine (elektrina v kondenzatorju, rezervoar vode, ...)
	- pretok (el, tok, pretok vode, toplota, ...)
	- gonilna sila (el. napetost, visinska razlika, tlak, ...)
2. Dinamicne lastnosti
	- Upornost = $\frac{gonilna sila}{pretok}$
	- Kapacitivnost = $\frac{gonilna sila}{\frac{d gonilna sila}{d t}}$
	- vztrajnost = $\frac{gonilna sila}{\frac{d pretok}{d t}}$
	![[Pasted image 20241018114835.png]]

## Modeliranje v praksi
- Vsak dinamicni sistem izkazuje neke dolocene karakteristike, ki so njemu lastne
- Obnasanje dinamicnih sistemov lahko pazujemo glede na razlicne zacetne pogoje, vhodne podatke in motnje v razlicnih podrocjih delovanja
- V dolocenih primerih ni mogoce opazovati obnasanja dinamicnega sistema zaj bi lahko to bilo _nevarno, neekonomsko ali okoljsko nesprejemljivo_

__Model sistema je sistem, ki izkazuje enake (podobne) lastnosti in relacije kot izhodiščni sistem, a v drugačni obliki zapisa oz. izvedbe__

Omejitve realnega eksperimetiranja:
- Dolgotrajnost
- Nevarnost za ljudi in okolico
- Veliki stroski
- Ekolosko nedopustne posledice
- Ni izvedljivo
![[Pasted image 20241018115354.png]]

__Kaj lahko dosezemo z modeli sistemov?__
- Izboljasmo poznavanje in razumevanje mehanizmov delovanja sistema oz. procesa
- Napovedujemo obnasanje sistema v prihodnosti in pri dolocenih vhodnih podatkih
- Ocenjujemo nemerljive parametre (programski senzor)
- Analiziramo obcutljivost realnega sistema (obnasanje pri razlicnih pogojih)
- S simulatorji usposabljamo strokovni kader (piloti, kirurgi, ...)
- Nacrtujemo vodenje sistemov (razvoj metod, razvoj resitev, ...)
- Omogocimo eksperimente, ki bi bili dragi, dolgotrajni., tvegani, problematicni ali neizvedljivi

_Modeliranje_ in _simulacija_ sta dva nelocljiva postopka, ki vsebujeta kompleksne aktivnosti v zvezi z izgradnjo modelov in eksperimentiranjem z modeli z namenom pridobivanja podatkov o bonasanju sistema, ki ga modeliramo

- modeliranje je primarno vezano na zapis relacij med _realnim sistemom_ in _njegovimi modeli_
- Simulacija pa se ukvarja s povezavo med _matematicnimi_ in _simulacijskimi modeli_:
	- S simulacijo je mogoce zelo fleksibilno eksperimentirati
	- Pridobljene casovne odzive vsaj v zacetni fazi uporabljamo za vrednotenje modela
	- Simulacija da modelom pravo dodano vrednosti

Najpomembnejse _zakonitosti_ pri modeliranju:
- Model naj obravnava le _bistvene vidike_ realnega sistema
- Model naj poudarja tiste ucinke sistema, ki so pomembni s stalisca _namena modeliranja_
- Model naj bo _cim bolj enostaven_, saj so kompleksi modeli neprakticni, neekonomicni in obicajno povezani s tezavami pri simulaciji (dolgotrajnost, numericne tezave)
- Pri modeliranju moramo skrbno analizirati, _kaj upoštevati_ in _kaj zanemariti_ (zanemariti moramo dele, ki imajo majhen vpliv na delovanje, ne pa delov, ki jih ne razumemo dobro),
- Pri modeliranju moramo skrbno _upoštevati omejitve_ (npr. fizične omejitve signalov in komponent),
- Model naj _predstavi naše znanje o sistemu v primerni obliki_ (enačbe, računalniški program ...).
![[Pasted image 20241018120342.png]]
![[Pasted image 20241018120446.png]]

__Na kaksne nacine lahko modeliramo?__
- _Teoreticno modeliranje:_
	- Upostavanje fizikalnih zakonov
	- Zapis z matematicnimi enacbami
- _Eksperimentalno modeliranje:_
	- merjenje vhodnih (vzbujanj) in izhodnih(odzivov)
	- Iskanje optimalne strukture oz. dinamike sistema, ki zadosti vhodno-izhodnim relacijam
- _Kombinirano:_
	- Kombinacija obijuh zgornjih pristopov

### Znacilnosti __teoreticnega modeliranja__
Bistvo tega pristopa je v dobrem poznavanju fizikalnih zakonov o:
- Ohranitvi mase
- Ohranitvi energije
- Ohraniti gibalne kolicine
- Zelo prakticni so tudi razlicni zakoni iz ustreznega podrocja (Kirchoff, Newton,...)
- Teoreticni pristop modeliranja je uporaben v vecini tehniskih znanosti
- Ce fizikalnega ozadja dolocenega sistema ne poznamo, tk pristop ni uporaben
- Pri mehkih znanostih je _teoreticno modeliranje manj primerno_, saj nas tovrsten pristop obicajno vodi do prekompleksnih modelov
- Najveckrat se moramo odlociti za smiselne _zanemaritve_, _poenostavitve_ in razne predpostavke, ki omogocajo zapis sistema s cim enostavnejsim modleom
- Poiskati moramo kompormois med _natancnostjo_ in _kompleksnostjo_ modela, pri cemer ima odlocilno vlogo _name modeliranja_
- _Sodelovanje problemskega strokovnjaka_ je v postopku modeliranja nujno
- Pomembna lastnost teoreticnih modelov je, da jih lahko _uporabimo tudi za podobne probleme_ ob ustrezni spremembi parametrov
- Pomembno je tudi, da lahko modele uporabljamo _ze v fazi nacrtovanja_ nekega objekta in takrat, ko meritve na sistemu iz kakrsnega kli vzroka niso mogoce

Kaj je izhodisce pri teoreticnem modeliranju:
- Modeliranja elektricnih sistemov se lotimo s Kirchoffovimi zakoni
- Modeliranje mehanskih sistemov se lotimo z Newtonovimi zakoni
- V splosnem in vedno velja, da lahko za izgradnjo modela uporabimo _zakone o ohranitni mase, energije in gibalne kolicine_ in njihovo formulacijo z besedilnim zapisom:
$$
\begin{gather} 
shranjeni tok = vstopajoci tok - izstopajoci tok \\
q_{shr} = q_{vs}-q_{iz}
\end{gather}$$
Tok je lahko _masni, volumski, energijski_ ali celo _informacijski_

Enostaven __primer teoreticnega modeliranja je ogrevanje__
![[Pasted image 20241018123107.png]]

Ravnotezna enacba:
$$k\cdot \frac{dT(t)}{dt} = q_{vs}(t) - q_{iz}(t)$$
#TODO zmanjkalo je slajdov
### Elektricni sistemi
__Osnovni pojmi, velicine, zakoni in relacije:__
1. Osnovni _velicini:_
	- U[V] napetost
	- I[A] tok
2. Osnovni nekineki...


#TODO dopolni


