# Digitalno vodenje
- izvedeno z racunalnikom / mikrokrmilnikom/ programirljivim vezjem ali kakrsimkoli digiralnim sistemom`
- izraz poudraja vrsto realizacije vodenja, saj isgnali velik del casa potujejo v digitalni obliki
- _sorodno:_ casovno diskretno vodenje:
	- poudarja casovno diskretizacijo signalov
	- definiramo vzorcene signale, predpostavimo da so vzorceni v enakomernih casovnih intervalih, omogoca uporabo uveljavljenih metod za analizo in nacrtovanje sitemov
- skupno vsem sistemom je dejstvo, da vodenje ne deluje cel cas, amoak se ukazi posljejo le ob diskretnih trenutkih, ki jih doloca:
	- prihod nove informacije o vodenem sistemu
	- izvedbe algoritma vodenja
- Izvedba digitalnega vodenja obicajno vkljucuje:
	- AD pretvorbo
	- Izvedbo algoritma vodenja v digitalnem elektronskem vezju
	- pretvorba digitalne regulirne velicine v analogni signal
- Operacije v sistemu digitalnega vodenja zahtevajo precej casa, zato jih je mogoce izvajati le v diskretnih casovnih trenutkih
![[Pasted image 20241007114336.png]]
Na zgornji shemi digitalnega vodenja je povratna zanka enaka, kot pri analognem vodenju, razlika je v _zgornjem delu:_
- potrebujemo pretvornik analognega signala iz senzorja v digitalno velicino (ADC)
- pretvorjeni signal se obdela v digitalnem sistemu
- digitalni signal na koncu moramo pretvoriti nazaj v analogni signal, s katerim krmilimo dejanski sistem
Shema nakazuje na dejstvo, da je vodenje lahko:
- Odprtozancno, oziroma krmiljenje. Krmilna kilicina ni odvisna od izhodne velicine procesa (crtkana crta)
- Zaptrtozancno vodenje, obicajno a ne nujno
## Zakaj digitalno vodenje

Obicajno je digitalni racunalnik del zanke, ki obdeluje podatke in zahteva vzorceno kolicino, vcasih je razlog narava procesa, senzorja, ali aktuatorja, npr:
- kamera vraca le eno sliko hkrati, le nekajkrat na sekundo
- radar lahko poslje signal le enkrat na obrat antene...

## Prednosti digitalne realizacije vodenja
- Digitalni parametri niso podvrzeni lezenju in so neobcutljivi na vplive okolja
- Digitalna realizacija mogooca  poljubno natancnost parametrov izvedbe operacij, analogne so pri tem tezavne
- Vecja fleksibilnost, predvsem pri povezovanju z nadrejenimi racunalniki.
- Digitalni spomin je lazje realizirati kot analogni

## Prehod analogno -> digitalno
- sistem sestavljajo zvezni in casovno diskretni gradniki, katera orodja je potrebno uporabiti za dolocitev casovnih in frekvencih odzivov tovrstnih sistemov
- Razvoj algoritmov digitalnega vodenja:
	- diskretizacija zveznih signalov
	- razvoj od zacetka 
- Kako izbrati cs vzorcennja glede na ostale sistemske parametre?
- Sistemi digitalnega vodenja vnasajo v sistem zakasnitve in sum kvantizacije, kaksen vpliv ima to na vodenje?
- Katere strategije je smiselno uporabiti ce upostevamo prekticne vidike in stroske izvedbe?

## Implementacija digitalnega vodenja
- Izredno pomembno logo imata uporabljena strojna in programska oprema
- Algoritme in parametre je potrebno prilagoditi glede na uporabljeno infrastrukturo
- Glede na vrsto stroje opreme se spreminja tudi uporabljena programska oprema
- Potrebno se je zavedati omejitev zaradi opreme. Povezano je s hitrostjo prekinitev, specifikacijami OS...

## Osnovni pojmi o vrstah signalov
- __Casovno zvezni signal:__ Funkcija, ki je definirana na zveznem vasovnem intervalu, katere amplituda lahko zavzame zvezno podrocje vrednosti
- __Analogni signal:__ Funkcija definirana na zveznem casovnem intervalu, kjer lahko amplituda lahko zavzame zvezno podrocje vrednosti
- __Kvantizacija:__ Opisuje proces nastavitve spremenljivke z naborom razlicnih vrednosti (lahko zavzame le dolocene)
- __Casovno diskretni interal:__ Funkcija deifirana le v posameznih casovnih trenutkih (cas je kvantiziran)
- __Vzorcen signal:__ Poseben primer, kjer je amplituda zvezna
- __Digitalni signal:__ Funkcija, kjer stacas in amplituda kvantizirani velicini

## Casovno diskretni ali digitalni signal?
- v praksi imata casovno diskretni in digitalni signal pogosto pomenita isto
- velik del teorije diskretnih signalov je uporaben tudi za digitalne signale, ni potrebno vendo strogo lociiti
- Izraz _casovno diskretni signal_ se pogosto uporablja pri teoreticnih raziskavah
- Izraz digitalni pa se uporablja pri opisu realizacije aparaturne in programske opreme

## Tipicna blokovna shema
![[Pasted image 20241007122345.png]]
 Standardna predstavitev digitalnih signalov je binarna

## Casovno multipleksiranje
- Dokaj zapleten postopek A/D pretvorbe, obravnavanje tako dobljenih digitalnih signalov in koncno D/A pretvorba tvorijo tako kompliciran proces, da obicajno ni ekonomicen za obravnavanje enega samega kanala
- Bistevana prednost digitalnega koncepta je moznost obravnave vecjega stevila kanalov z isto aritmeticno enoto, kar lahko dosezemo s t.i. __casovnim multipleksiranjem:__
	- Med posamicnimi vzorci je relativno dolga perioda, v tej periodi lahko vodimo v racunalnik vzorce drugih signalov
	- Posamezne kanale beremo drugega za drugim, vzorcene vrednosti pa v istem vrstnem redu pretvorimo v binarna stevila,, ki jih obdelamo in ustrezno locimo v originalne kanale s pomocjo demultipleksorja
	- Sinhronzacija A/D pretvorbe, obdelave signalov in D/A pretvorbe
### Shema multipleksiranega sistema
![[Pasted image 20241007124234.png]]

## Negativni ucinki kvantizacije
_Osnono vprasanje:_ Ali smo pri postopku kvantizacije izguili kaj informacije?
Signal smo vzorcili le v disretnih casovnih intervalih, pri kvantizaciji pa smo dejansko amplitudo nadomestili z najblizjo standardno vrednostjo
- Kvantizacija po amplitudi: __kvantizacijski pogresek__
- Kvantizacija po casu: __teorem o vzorcenju__
- Teorem o vzorcenju pravi, da lahko frekvencno omejeni signal teoreticno rekonstruiramo iz diskretnih vzorcev, ce je frekvenca vec kot dvakrat visja od najvisje frekvence vzorcenega signala (v praksi se nekoliko visja)
- Vhodni signal filtriramo analogno, da porezemo nezeljene visoke frekvence
### Fenomen zgibanja frekvenc
- Ce frekvenca vzorcenja ni dovoj visoka, se pojavi fenomen zgibanja frekvenc ali prestavitve frekvenc
- Poseben primer tega fenomena je primer kolesa prerijske kocije
	- Vsaka slicica ustreza diskretnemu vzorcu
	- ce je kot zasuka prevelik glede na hitrost snemanja, se kolo navidezno vrti v obratno smer

### Kvantizacijski pogresek
- V praksi obstaja zgornja meja stevila bitov, zato obstaja pogresek kvantizacije ali sum kvantizacije
- Pogresek kvantizacije lahko poljubno zmanjsamo s povecanjem stevila bitov ADC
- Naj bosta $E_max$ in $E_min$ maksimalna oziroma minimalna vrednost signala in $q$ resolucija ADC, torej razdalja med sosednjima nivojema
- Z uporabo prej definiranih n (stevila bitov) in m (stevila intervalov), lahko zapisemo: $$q=\frac{E_max - E_min}{2^n}= \frac{E_max - E_min}{m}$$
- Definiramo kvantizacijski pogresek $\epsilon_z(t)$ kot razliko med analognim signalom in kvantiziranim analognim signalom
![[Pasted image 20241007132624.png]]
- Kvantizacijski pogresek se spreminja od 0 do $\frac{q}{2}$
- casovni potek signala na vsakem od intervalov je priblizno linearen, srednja vrednost je priblizno enaka 0
- Ker nas zanima moc kvantizacijske naoake, bomo predpostavili linearen potek kvantizacijskega pogrsaka
### Varianca kvantizacijskega pogreska
$$\sigma^2 = \frac{1}{t_2-t_1}\cdot \int_{t1}^{t_2}\epsilon_z^2(t)dt$$
$$\sigma = \frac{q}{2\sqrt{3}}$$

## Vplivanje na velikost suma kvantizacije
- opazimo lahko, da zavisi varianca suma kvantizacije samo od resolucije ADC, ne pa od trenutnega casa, dolzine signala ali strmine pogreska
- Kvadratni koren RMS vrednosti je enak $\frac{1}{\sqrt{3}}$ kratni vrednosti maksimalnega pogreska kvantizacije $\frac{q}/{2}$ 
- Zakljucki:
	- pri vzorcenju ne zgubbimo nobene informacije, ce izberemo dovolj visoko vzorcno frekvenco
	- Z izbiro zadostnega stevila bitov ADC lahko zmanjsamo pogresek kvantizacije na poljubno nizek nivo
	- Ta koncept dopusca predstavitev casovno zveznega signala v obliki vrste diskretnih binarnih stevil
## Fourierova vrsta
Zvezno periodicno funkcijo s periodo T ki zadosca dolocenim omejitvam lahko zapisemo v obliki neskoncne vsote harmonicnih izrazov

$$X_Z(t) = \sum^\infty_{m = -\infty} c_m \cdot e^{jm\omega_1t}$$
Kjer so koeficienti $c_m$ podani z izrazom
$$c_m = \frac{1}{T} \int^{T/2}_{-T/2} x_2(t)\cdot e^{jm\omega_1t} dt$$
in je T perioda funkcije $f_1 = \frac{1}{T}$ je osnovna ciklicna frekvenca $\omega_1 = 2\pi \cdot f_1$ je osnovna krozna frekvenca in m celo stevilo, ki definira red harmonicnega izraza

#TODO Ponovi kompleksna stevila in vrste
- Koeficienti $c_m$ so v splosnem kompleksna stevila, zato jih lahko zapisemo v naslednji obliki:
 $$c_m = |c_m|\cdot e^{j \Phi m}$$
 pri cemer serijo ali zaporedje koeficientov $c_m$ imenujemo __frekvencni spekter__ danega periodicnega signala, zaporedje $|c_m|$ predstavlja __amplitudni spekter__, zaporedje $\Phi_m = arg c_m = \sphericalangle c_m$ pa __fazni spekter__
 - bistvena znacilnost frekvencnega spektra periodicne funkcije je __njegova frekencna diskretnost__, saj vsebuje le enosmerno komponento, komponento osnovne frekvence $f_1$ (prvi harmonik) in komponente celostevilcnih mnogokratnikov osnovne frekvence (visje harmonske komponente)

### Primer: Vlak pulzov
![[Pasted image 20241007151335.png]]
- Serija $c_m$ za ta pirmer:
$$c_m  = \frac{1}{T} \int_{T/2}^{T/2} A\cdot e^{-j m \omega_1 t}dt = Ad \cdot \frac{sin \space m \pi d}{m \pi d}$$
- Pri tem velja $d = \frac{\tau}{T}$
- Koeficienti $c_m$ so realni
- Negativna amplituda pomeni komponente s fazo $-\pi$
- Na abscisni osi m <-> f
- $d = \frac{1}{5}$

_ker je signal sod, velja da sinusne komponente nimamo, posledicno so vsi koeficienti $c_m$ realni_

__"Domaca naloga" je de dokazemo zgornjo formulo__

## Kardinalni sinus (sinc)
- Nanj pogosto naletimo v teoriji obdelave signalov
- Definicija v matematiki:
![[Pasted image 20241007153122.png]]
- Na podrocju obdelave signalov se uporablja normirani kardinalni sinus
![[Pasted image 20241007153156.png]]
- funkcija sinc(x) je povsod analiticna (pri x = 0 pride do krajsanja pola iz nicle), zvezna in zvezno odvedljiva
- Z upostevanjem definicije sinc(.) se fourierova transformacija vlaka pulzov zapise v bolj kompaktni obliki:
$$c_m = Ad\space sinc(md) = Ad\space sinc(f\tau)$$
## Fourierova transformacija
- Fourierova transformacija omogoca dolocitev spektra __neperiodicnega signala__
- Omejili se bomo na signale, ki bsebujejo koncno energijo
- Fourierova transformacija zveznega signala $x_2(t)$:
$$x_2(f) = F\{x_2(t)\}= \int_{-\infty} ^\infty x_2(t) e^{-j 2\pi f t} dt$$
- Fourierova transformacija F{} je linearni operator, ki operira nad casovno zveznimi (in obicajno realnim) signalom $x_2(f)$, ki jo vcasih imenujemo tudi Fourierova transformiranka
- Ena od oblik apisa Fourierove transformacije je tudi:
![[Pasted image 20241007153952.png]]
- Pripadajoca inverzna Fourierova transformacija transformira signal iz frekvencnega nazaj v casovni prostor:
$$x_2(t) = \int^{\infty}_{-\infty} X_z(f) \cdot e^{j2\pi f t }df$$
- Frekencni spekter neperiodicne funkcije je v splosnem kompleksen, zato lahko zapisemo:
$$X_z(f) = |X_z(f)|e^{j \Phi (f)}$$
- __Bistvena znacilnost frekvencnega spektra neperiodicne zvezne funkcije je njegova zveznost__, saj vsebuje v obmocju, kjer je razlice od 0, komponente vseh frekvenc


### Osnovne lastnosti fourierove transformacije
![[Pasted image 20241007154343.png]]
#TODO ponovi lastnosti fourierove transformacije

### Primer: neperiodicni pulz
- Fourierova transformacija signala $p_2(t)$:
![[Pasted image 20241007155040.png]]

$$c_m  = \frac{1}{T} \int_{T/2}^{T/2} A\cdot e^{-j m \omega_1 t}dt = Ad \cdot \frac{sin m \pi d}{m \pi d}$$
- Ker je funkcija $p_2(t)$ soda, je njena Fourierova transformacija realna funkcija
	- _imaginarni del funkcije se iznici, ker je integral lihe finkcije (imaginarne komponente) po simetricnem intervalu enak 0_
- Negativna amplituda poleni fazo signala $-\pi$
![[Pasted image 20241007155152.png]]


## Diskretni signali
- Diskretni signali predstavljajo pomemben koncept sistemske teorije
- Z njimi predstavljamo casovni potek neke velicine
- V naravi so skoraj vsi signali zvezni, tako po amplitudi, kot po casu (analogni signali)
- Pojem _diskretni signal_ je povezan z diskretizacijo neodvisne spremenljivke signala, gre torej za __odvisno spremenljivko, ki je definirana le v diskretnih tockah neodvisne spremenljivke__
- Pri uporabi v vodenju, diskretne signale obicajno dobimo z vzorcenjem zveznih, ceprav to v splosnem ne velja.

### Zapis in prikazovanje diskretnih signalov
- Diskretni signal si lahko predstavljamo kot neskoncno zaporedje stevil
- Signal ima poljubno ime (obicajno pisano z malo zacetnico), neodvisna spremenljivka (obicajno _k_) lahko zavzema poljubno celo stevilo
- Moznosti zapisa diskretnega signala $x(k)$:
	- Zapis zaporedja:
	$$ x(k) = \{1, 0, -1, 0, 1, 0, -1, 0, ...\}$$
		- Iz zapisa ni razvidno, kateri vrednosti neodvisne spremenljivke _k_ pripada kateri element (ceprav obicajno zacnemo z 0)
		- Zaporedje je neskoncno, zato je nemogoce enolicno dolociti nadaljevanje
	- Analiticen zapis (v nasem primeru 2 moznosti)
	$$x(k) = \begin{cases} (-1)^{\frac{k}{2}} & \text{, } k = 2l, l \in \mathbb{N}_0 \\ 0 & \text{, } k = 2l + 1, l \in \mathbb{N}_0 \end{cases} \quad \text{ali} \quad x(k) = \cos \left( k \frac{\pi}{2} \right) \quad k \in \mathbb{N}_0$$


## Vzorceni signali
- Predstavljajo zvezo med casovno zveznimi in casovno diskretnimi/digitalnimi signali
- V nadaljevanju locimo pojma:
	- __Vzorceni signal:__ 
		- Casovno zvezni signal, sestavljen iz vlaka pulzov, informacija o amplitudi originalnega signala je shranjena v amplitudi ali v ploscini teh pulzov
		- Ta oblika je pomembna pri teoreticni analizi in izpeljavi enacb
		- Oznacujemo jih z zvezdico, npr. $x^*(t)$
	- __Vzorceni diskretni signali:__
		- Casovno diskretni signali oziroma zaporedje vzorcev, dobljenih z vzorcenjem casovno zveznega signala, pri cemer sta amplituda zveznega signala in amplituda pripadajocega vzorca v trenutku vzorcenja enaki
		- Ta oblika je izredno uporabna za obdelavo z racunalniki
		- Oznacujemo jih kot funkcije diskretne spremenljivke _k_ npr. $x(k)$

## Vzorcenje signalov s pulzi koncne sirine
- Vzorceni signal dobimo z vzorcenjem casovno zveznega signala v casovnih intervalih s periodo T
- __Frekvenca vzorcenja:__ $f_s = \frac{1}{T}$
- Pulzi imajo koncno sirino, ki je obicajno veliko manjsa kot perioda vzorcenja
![[Pasted image 20241007193742.png]]
- Vzorcimo tako, da mnozimo zvezni signal $x_z(t)$ z vlakom impulzov $p_z(t)$, le-ta pa je peridicni signal s periodo T in trajanjem impulzov $\tau$
- Rezultirajoci sifnal tako sestoji iz serije relativno ozkih pulzov, katerih amplituda je modulirana z originalnim, casovno zveznim signalom
- To vrsto vzorcnih signalov imenujemo __pulzno amplitudno modulirani signal__
- Vzorceni signal oznacimo z $x^*(t)$, originalni signal pa z $x_z(t)$. Vzorceni signal lahko smatramo kot produkt $x_z(t)$ in hipoteticnega vlaka pulzov $p_z(t)$
$$ x^*(t) = x_z(t) \cdot p_z(t)$$
## Dolocanje spektra vzorcenega signala (vzorcenje s pulzi koncne sirine)
- Zapis $p_z(t)$ v obliki Fourierjeve vrste:
$$p_z(t) = \sum_{m=-\infty}^{\infty} c_m e^{jm \omega_s t} = \sum_{m=-\infty}^{\infty} c_m e^{jm 2\pi f_s t}
$$
- Koeficienti $c_m$ imajo frekvencni potek v obliki $\frac{sin m\pi d}{m \pi d}$, zato:
$$x^*(t) = \sum_{m=-\infty}^{\infty} c_m x_z(t) e^{jm \omega_s t} = \sum_{m=-\infty}^{\infty} c_m x_z(t) e^{jm 2\pi f_s t}
$$
- Frekvencni spekter vzorcenega signala dobimo s Fourierovo transformacijo gornje enacbe. Vsak sumand desne strani izraza lahko transformiramo upostevajoc lastnost modulacije
$$e^{j 2\pi f_0 t} x_z(t) \xleftrightarrow{\mathcal{F}} X_z(f - f_0) \implies X^*(f) = \sum_{m=-\infty}^{\infty} c_m X_z(f - m f_s)
$$
- Glede na prejsnjo enacbo spekter sestoji:
	- Iz spektra originalnega signala $X_z(f)$, pomnozenega s $c_0$ in 
	- Iz neskoncnega stevila za, vrednost frekvence vzorcenja in njenih mnogokratnikov, premaknjenih kopij originalnega spektra (pomnozenih s $c_m, m \neq 0$)
	- Spomnimo se primera vlaka pulzov:
	$$c_0 = Ad = \frac{A \tau}{T} = \frac{1}{T} ; A\tau = 1$$
	- Zato velja:
	$$X^*(f) = \frac{1}{T}X_z(f) \quad |f| < \frac{f_s}{2}$$
	- Z narascanjem m, gre $c_m$ proti 0, zato komponente spektra z visanjem frekvence pozasi izginjajo (crtkana ovojnica)
![[Pasted image 20241007195338.png]]

## Idealno ipulzno vzorcenje
- Prej smo vzorcili signale z vlakom impulzov koncne sirine
- Sedaj vzemimo limitni primer, sirina pulzov gre proti 0, amplituda pa proti $\infty$, ploscino pod impulzi ohranimo enako 1
- Idealno pulzno vzorcenje:
	- Ploscina pod impulzom -> dolzina in smer puscice
	- Vlak impulzov:
$$p_\delta(t) = \sum_{k = -\infty}^{\infty}\delta(t- kT)$$
	- Vzorceni signal:
	$$x^*(t) = x_z(t)p_\delta(t) = x_z(t) \sum^{\infty}_{k = -\infty}\delta(t- kT)$$
	![[Pasted image 20241007195945.png]]


## Upravicenost uporabe koncepta idealnega impulznega vzorcenja
- Ceprav analogni vzorec kaaterega koli vzorcenega signala, ki ga dobimo direktno iz casovno zveznega signala, ne more nikoli doseci ekstremne vrednosti sirine ($\tau = 0$), ima ta koncept 2 bistveni lastnosti:
	- Ce je sirina pulza majhna glede na casovne konstante sistema, predstavlja impulzno vzorcenje dobro aproksimacijo in vodi k enostavnejsi analizi
	- Ce analogni signal vzorcimo in pretvorimo v digitalno obliko, ga lahko  smatramo kot stevilo, ki se pojavi v dolocenem casovnem trenutku. Zaporedje stevil, ki se pojavi v racunalniku, lahko predstavlja z matematicnega stalisce utezi vlaka impulzov. Ta koncept je zelo vazen in ga bomo uporabljali pri nadaljni obravnavi digitalnih signalov

## Dolocanje spektra vzorcenega signala (idealno impulzno vzorcenje)
- Serija $c_m$ za vlak $\delta$ impulzov:
$$c_m = \frac{1}{T} \int_{-\frac{T}{2}}^{\frac{T}{2}} \delta(t) e^{-jm 2\pi f_s t} dt = \frac{1}{T} e^{-jm 2\pi f_s t} \bigg|_{t=0} = \frac{1}{T}
$$
- Predstavitev vlaka impulzov $p_\delta(t)$ v obliki Fourierove vrste:
$$p_\delta(t) = \sum_{m=-\infty}^{\infty} \frac{1}{T} e^{jm 2\pi f_s t}
$$
- Vzorceni signal (kjer $x_z(t)$ ni odvisen od m, lahko znotraj $\sum$):
$$x^*(t) = x_z(t) p_\delta(t) = \frac{1}{T} \sum_{m=-\infty}^{\infty} x_z(t) e^{jm 2\pi f_s t}
$$
- Frekvencni spekter vzorcenega signala:
$$e^{j 2\pi f_0 t} x_z(t) \xleftrightarrow{\mathcal{F}} X_z(f - f_0) \implies X^*(f) = \frac{1}{T} \sum_{m=-\infty}^{\infty} X_z(f - m f_s)
$$

## Frekvencni spekter vzorcenega signala  (idealno impulzno vzorcenje)
- Glede na prejsnjo enacbo spekter sestoji:
	- Iz spektra originalnega signala, pomnozenega z $\frac{1}{T}$ in
	- Iz neskoncnega stevila za vrednost frekvence vzorcenja in, za njene mnogokratnike, premaknjenih kopij originalnega spektra, pomnozenih z $\frac{1}{T}$  
- Primerjava $X_z(f)$ in $X^*(f)$:
	- Pri nizkih frekvencah spet (ker vzorcimo z impulzi ploscine 1):
	$$X^*(f) = \frac{1}{T}X_z(f) \quad |f| < \frac{f_s}{2}$$
	- Za razliko od vzorcenja s koncnimi pulzi, spektralne komponente z visanjem frekvence ostajajo konstantne (crtkana ovojnica)
![[Pasted image 20241007201916.png]]

## Idealno pulzno vzorcenje - zakljucek
- Frekvencni spekter vzorcnega signala je preslikava frekvencnega spektra originalnega signala v neskoncno stevilo premescenih verzih, ki pa so frekvencnemu spektru originalnega signala proporcionalne preko konstante $\frac{1}{T}$
- __Bistveni zaključek tega poglavja je, da je spekter impulzno vzorčenega signala periodična funkcija frekvence__
- Perioda v frekvencnem prostoru je enaka frekvenci vzorcenja $f_s$
- Vzorcenje v casovnem prostoru vodi torej do periodicnosti funkcije v frekvencnem prostoru

## Vzorceni diskretni signali
- Diskretni signal ni vedno dobljen z vzorcenjem zveznega, ceprav pri vodenju to obicajno drzi
- V proces vzorcenja zveznega signala $x_z(t)$ se v vzorceni signal $x^*(t)$ prenese zgolj informacijo o vrednosti zveznega signala v trnutkih vzorcenja, takrat je zvezni cas t enak veckratniku periode vzorcenja T
- Vzorceni diskretni signal $x(k)$ dobimo tako, da v zveznem signalu nadomestimo neodvisno spremenljivko t s $kT$:
$$x(k) = x_z(t) \bigg|_{t = kT} = x_z(kT)$$






## Whittaker - Shannonova interpolacijska formula





## Parsevalov teorem

Teorem k ise zadeva moci in energije signala

Moc sgnala:
$$|Z|^2 = Z \cdot Z^*$$




