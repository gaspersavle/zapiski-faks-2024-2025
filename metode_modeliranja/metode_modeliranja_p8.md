## Epidemioloski prostorni modeli
### Model SIS
Primeri epidemioloških prostornih modelov: __model SIS__
- (ogrožen –inficiran– ogrožen) 
- (ang. susceptible – infected – susceptible), npr. navadni prehlad, gripa...
Modele SIS sestavljata 2 prostora, na ta nacin populacijo razdelimo na:
- Prostor okuzenih
- Prostor neokuzenih
![[Pasted image 20241203112510.png]]

Za vsak prostor predpostavimo diferencialno enacbo spreminjanja stevila ljudi v njem

$$\begin{gather}
\frac{dS(t)}{dt} = -aS(t)I(t) + bI(t) \\
\frac{dI(t)}{dt} = aS(t)I(t) - bI(t) \\
N = S(t) + I(t) \\
\frac{dN(t)}{dt} = 0  = \frac{dS(t)}{dt}+\frac{dI(t)}{dt}  \\
\end{gather}$$
Kjer so parametri modela:
- a: _koeficient stikov posameznika z okuzenimi na dan_
- b: _koeficient dni za ozdravitev_

![[Pasted image 20241203113003.png]]

### Model SIR
model __SIR__ (ogrožen – inficiran – rezistenten)
(ang. susceptible – infected – resistant), npr. rdečke, ošpice, mumps ...

![[Pasted image 20241203113119.png]]

### Model SIRD
Primeri epidemioloških prostornih modelov: __model SIRD__
(ogrožen – inficiran – ozdravljen –umrl) 
(ang. susceptible – infected – recovered – deceased), npr. Sars-Cov2, ebola ...

Za model SIRDe je značilno, da jih sestavljajo štirje prostori. Na tak način celotno opazovano populacijo razdelimo v:
- Prostor neokuzenih (S)
- Prostor okuzenih (I)
- Prostor ozdravljenih (R)
- Prostor umrlih (D)
Za vsak prostor postavim odiferencialno enacbo spreminjanja stevila ljudi v njem
#TODO  dopolni enacbe

Simulacije modela:
![[Pasted image 20241203113550.png]]
1. Scenarij: ogromna smrtnost, prezivi le 7,5% ljudi
2. Scenarij: hitrost umiranja je pozasnejsa zaradi omejitve v dostopu do zdravil
3. Scenarij: smrtnost je v ustaljenem stanju najnizja (prezivi najvec ljudi)

V praksi se uporablja veliko izpeljank epidemioloskih modelov, kjer je stevilo prostorov odvisno od _modelirane epidemije in njenih specifik_ in ni omejeno na zgoraj omenjene prostore:
- __SIRV__ (susceptible – infected – recovered – vaccinated)
- __SEIR__ (susceptible – exposed – infected – recovered)
- __SEIS__ (susceptible – exposed – infected – susceptible)
- __MSEIR__ (passive immune – susceptible – exposed – infected – recovered)

# Populacijski modeli
- Spadajo v skupino dobro raziskanih sistemov
- Gradnjo matematicnih modelov temeljimo na ze odkritih znamenitostih (revnotezni zakoni)
- Upostevanje ze velikokrat preverjenih in dokazanih zakonitosti omogoca v splosnem tudi vecje zaupanje v uporabo modela

__Populacija__ je skupina organizmov iste vrste, ki zaseda določen prostor v določenem času in se v splošnem lahko razmnožuje. Ta izraz se lahko uporablja tudi na prebivalstvo v nekem specificnem dolocenem prostoru.

Pogosto si v naravi isti življenjski prostor delijo _različni organizmi_. Med njimi se lahko
razvijejo __odnosi__, ki so prijateljski, sovražni, tekmovalni, sodelujoči ali soodvisni. Pri
tem lahko pride tudi do precej _zapletenih pojavov._

Modeliranje populacij je pomembno za:
- Raziskovanje vpliva razlicih dejavnikov na velikost in starost populacije, vpliv velikosti in starosti na dejavnike
- Raziskovanje vpliva populacij na ohranjanje okolja
- Studije sirjenja mikroorganizmov, virusov  in bakterij
- Studije ohranjanja ogrozenih vrst
- ...


## Relacije v populacijskih modelih
__Tekmovalen odnos:__
- različni osebki tekmujejo za isto vrsto hrane. Ta pojav je zelo podoben problemu gneče, ki smo ga obravnavali pri Verhulstovem modelu, oz. pri zvezni logistični enačbi.
- podobno kot pri žrtvah in roparicah tudi tu velja, da tekmovalnost izgine, če ena vrsta izumre, zato potrebujemo v enačbah mešani produkt. Za razliko od primera žrtev in roparic, se v tem primeru ta pojavi z negativnim predznakom:
$$
\begin{gather}
\dot x_1 = b_{11}x_1(t) - b_{12}x_1(t)x_2(t) \\
\dot x_2 = b_{21}x_1(t)-b_{22}x_1(t)x_2(t)
\end{gather}$$
- v tem primeru je predpostavljeno, da obe populaciji rasteta eksponentno, če rast ni omejena s tekmovalnostjo. Tekmovalnost pa eksponentno rast preprečuje.

__Sodelovalen odnos:__
- je nasproten pojav od tekmovalnosti, npr. simbioza dveh vrst.
- v primeru sodelovalnega odnosa je za ohranitev ene vrste potrebna druga in obratno
- značilno obliko modela v takšnem primeru podajata naslednji enačbi:
$$
\begin{gather}
\dot x_1 = -c_{11}x_1(t) + c_{12}x_1(t)x_2(t) \\
\dot x_2 = -c_{21}x_1(t) + c_{22}x_1(t)x_2(t)
\end{gather}$$
__Grupiranje:__
- je nasproten pojav od gneče
- mnoge živali živijo in se gibljejo v krdelu ali jati, ker so tako manj ranljive ali pa je morda gibanje energijsko ugodnejše
- tipično obliko modela grupiranja opisuje naslednja enačba:

$$
\begin{gather}
\dot x(t) = -d_{11}x_1(t)+d_{12}x^2(t)
\end{gather}$$
__Hkratna predstavitev vseh pojavov:__
- vse omenjene pojave lahko združimo v eni enačbi:
$$\dot x_i(t) = \left[a_i + \sum_{i =1}^n b_{ij}x_j(t) \right]x_i(t)$$
- pri tem elementi ai uravnavajo razmerje med rojstvi in smrtmi posameznih vrst v populaciji, diagonalni elementi matrike B med faktorji grupiranja in gneče, izvendiagonalni elementi pa ravnotežje med tekmovalnostjo in sodelovanjem.
- takšen opis vključuje tudi situacijo, ki smo jo obravnavali prej, to je odnos žrtve in roparice, kjer imajo žrtve vlogo sodelujočega, medtem ko imajo roparice tekmovalni značaj
- ta model predpostavlja, da so vse povezave med dvema vrstama binarne, to pomeni, da nimamo križnih produktov med več kot dvema vrstama. To je vsekakor smiselno. Če npr. tri vrste tekmujejo za isto hrano, modeliramo izraze, ki prispevajo k tekmovalnosti kot:
$$-b_{12}x_1(t)x_2(t)-b_{13}x_1(t)x_3(t) - b_{23}x_2(t)x_3(t)$$

- in ne kot:
$$-bx_1(t)x_2(t)x_3(t)$$
- kajti, ce ena od populacij izumre, ostali se vedno tekmujeta. Tudi _simbioza treh vrst ni poznana_

## Populacijska dinamika v Sloveniji
Primer modeliranja _populacijske dinamike_ v sloveniji in napoved spreminjanja populacije __v prihodnosti__:

![[Pasted image 20241203130634.png]]


# Vecagentno modeliranje

Definicija vecagentnega modeliranja:
- večagentno modeliranje je osredotočeno na opis __elementov sistema - agentov__ v izbranem okolju in njihovih medsebojnih odnosov ter odnosov z okoljem. Opazovanje teh odnosov pa pojasnjuje kompleksne dinamične lastnosti celotnega sistema.

Po tovrstnem načinu modeliranja posežemo, kadar je poznavanje, oziroma razumevanje problema na nižjem nivoju (nivo posameznih elementov – agentov in njihovih medsebojnih relacij) boljše.

Pri tovrstnem pristopu lahko eksplicitno opisujemo načine medsebojnega vplivanja agentov, njihovega organiziranja, oziroma samoorganiziranja pri procesih v sistemu, kar bi sicer teže upoštevali z drugačnimi načini abstrakcije.

Ena pomembnejših značilnosti tovrstnega modeliranja je, da združuje zelo različne sisteme, ki jih lahko uvrščamo sočasno __med zvezne pojave, med diskretne dogodke, med nizko- in visokonivojsko abstrakcijo__ opazovanega problema.

Združevanje omenjenega rezultira v __različne oblike hibridnega pristopa k modeliranju__
in pogosto je tudi rezultat modeliranja lahko __hibridna struktura__

Končni rezultat, tako s stališča uporabljenih metod kot s stališča rezultirajočega modela, je seveda odvisen od načrtovalca in upoštevanih __namenov in ciljev načrtovanja.__

## Agent
Beseda izvira iz latinske besede agere, kar pomeni __sporazumno delovati v imenu nekoga__
Navadno razumemo, da je agent entiteta ali enota, ki deluje bolj ali manj neodvisno, skladno z dolocenimi pravili, oziroma lastnostmi v izbranem okolju

__Agenti__ so lahko razlicni organizmi, stvari, koncepti itd...

Lastnosti agentov:
- Locimo lahko med agenti, ki komunicirajo z ostalimi in se zavedajo svojega okolja, ali takimi, ki teh lastnosti nimajo. Med agenti, ki imajo sposobnost _zaznavanja_ in tistimi, ki te lastnosti nimajo
- Opredeljujejo jih tudi __aktivnosti__, torej sposobnost avtonomnega delovanja na bazi sklepanja
- Avtonomnost pomeni, da je akcija agenta odvisna od njihovi odlocitev
- Pri avtonomnem odlocanju, agenti sledijo nekkim __preddefiniranim ciljem__
- __Iniciativnost__ je pomembna lastnost, ki izhaja iz ciljne orientiranosti agentov in njihove avtonomnosti

## Primer vecagentnega modela - igra zivljenja
- Gre za preprost primer, kjer sistem sestavlja mreza kvadratov poljubnih dimenzij. To je okolje, v katerega razporejamo tako imenovane celice, ki predstavljajo agente opazovanega sistema. Te celice so lahko zive ali nezive
![[Pasted image 20241203132912.png]]
- Vsaki celici dodelimo pravilo, glede na okolico v kateri se nahaja
	- Vsaka celica ki ima od osmih sosedov, manj kot 2 ziva soseda umre zaradi majhnosti okoliske populacije
	- Vsaka celica, ki ima 2 ali 3 zive sosede, prezivi do naslednje generacije
	- Vsaka celica, ki ima vec kot 3 zive sosede, umre zaradi okoliske populacije
	- Vsaka mrtva celica, ki ima natancno 3 zive sosede, ozivi
Opazujemo, kako se nas model spreminja v odvisnosti od casa. Dolocena zaceta stanja lahko generirajo velike populacije, nekatera zacetna stanja pa lahko vodijo v izumrtje opazovanih celic

Poznamo t.i. __stabilna zacetna stanja__:
![[Pasted image 20241203133325.png]]

Poznamo tudi __periodicno izmenjujoce se generacije:__
![[Pasted image 20241203133443.png]]

Poznamo tudi __gibajoce se skupine:__
![[Pasted image 20241203133509.png]]

Glede na opisano lahko ugotovimo, da gre za sistem:
- ki se dogaja v diskretnih casovnih trenutkih v diskretnem prostoru
- Taksen sistem je mogoce interpretirati kot __celicni avtomat__, ti so znacilni predstavniki modelov, ki jih uvrscamo na podrocje diskretnih dogodkov. Praviloma sestojijo iz eno ali vecdimenzionalnih mrez celic, ki se podrejajo dolocenim pravilom. Pravila in lastnosti okolij se lahko v splosnem med seboj razlikujejo

## Primer vecagentnega modela - Schellingov segregacijski model
- večagentno modeliranje se veliko uporablja tudi za namene __študija socialnih pojavov.__ Eksperimentiranje z ljudmi je seveda težavno in neetično, zato so modeli, ki razkrivajo samoorganizacijske sposobnosti opazovane družbe, lahko zelo zanimivi in uporabni. Omogočajo tudi eksperimentiranje z lastnostmi opazovanih osebkov (agentov), ki pripeljejo do pojavov, ki smo jim (bili) priča.
- Eden tovrstnih, zelo poznanih modelov, ki je vzbudil precej pozornosti, je tudi segregacijski model, ki ga je razvil ekonomist Thomas Schelling
- Ppredpostavimo mrežo dveh vrst elementov in praznih polj, kot prikazuje leva slika. Elementi (agenti) se počutijo dobro, če je vsaj polovica sosedov enakih (meja segregacije je 50%). Če se ne počutijo dobro, se bodo v naslednjem dogodku premaknili na naključno izbrano prazno sosednje mesto.

![[Pasted image 20241203134328.png]]
![[Pasted image 20241203134423.png]]
