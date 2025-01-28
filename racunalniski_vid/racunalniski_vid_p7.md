## Pristop z vecimi locljivostmi
- Filtriranje suma, detekcija robov, detekcija kotov in podobni algoritmi se vsi zanasajo na filtriranje z Gaussovim ifiltri
- V vsakem od teh primerov se soocamo z vprasanjem koliksne parametre naj izberemo za filtriranje. Vprasanje je _na bazi cesa se odlocimo za te parametre?_
- Odgovor na to vprasanje je __pristop z vecimi resolucijami__

### Vec-locljivostni pristop proti vec-velikostnem
#### Vec-locljivostni pristop
- Namesto procesiranja slike z njeno nazivno resolucijo, jo skaliramo na npr. $1/8$ njene originalne resolucije
	- Posledicno se skalirajo strukture na sliki, krog z radijem 50 px, se spremeni v krog z radijem 6,25 px
	- __Efektivno postane "soseska piksla" vecja, torej 3x3 jedro filtra pokrije obmocje 24x24 px__
- Prednost pristopa je, da ni treba nacrtovati jedra (kernela) razlicnih velikosti, namesto tega spremenimo locljivost obdelovane slike

#### Vec-velikostni pristop
- Pristop je nekoliko razlicen vec-locljivostnemu, vendar se uporablja za dosego istega efekta
	- Namesto spreminjanja resolucije po filtriranju pustimo sliko originalne velikosti in se tem ne spremenimo velikosti soseske posameznega piksla
- Teoreticno bi bilo enostavno najti optimalni parameter gaussovega filtra. To je _tisti, ki odstrani ves visokofrekvenci sum, ampak ohrani ves sigmal_
	- V praski je to naceloma nemogoce, saj filtriranje hkrati odstrani sum in informacijo

# Segmentacija
- Postopek razstavljanja slike na svoje pomembne semanticne komponente
![[Pasted image 20241206135214.png]]
- Segment  oziroma komponenta slike nam predstavlja  nabor pikslov, ki imajo skupno lastnost, npr. sivinsko vrednost, barvo, teksturo, izgled...
![[Pasted image 20241206135707.png]]
- Regija slike:
	- Nabor povezanih pikslov
	- Poleg tega, da so povezani si morajo deliti tudi skupno lastnost, torej spadajo skupaj
- Lastnost regije (opis)
	- Formalno je regija R nabor pikslov, za katerega velja:
$$R = \left\{i(x_i, y_i)| P(i(x_i, y_i)) = P_r \right\}$$
## Slike in regije
- Slika je razstavljena v regije
	- nekatere regije pripadajo istim objektom
	- preostale regije pripadajo ozadju
![[Pasted image 20241206140219.png]]
## Regija zanimanja
Glede na aplikacijo je mozno, da nas zanima samo ena regija, npr. v primeru avtonomne voznje je to cesta. Kratica za regijo zanimanje je po anglesko _region of interest -_ __ROI__

## Regije in segmentacija
- Vcasih komponente slike niso regije
	V- Sliko lahko naprimer razgradimo slike v ravne in ukrivljene segmente
- V nasem primeru, bo segmentacija _vedno pomenila razgradnjo slike na regije_

## Strategije segmentacije
- Segmentacija na regije
	- Identificiramo vse piksle, ki pripadajo isti regiji (so povezani)
- Alternativno lahko opisemo regije s krivuljo, ki jo zaobjema in opravljamo segmentacijo na bazi konture, tako locimo piksle na robovih regij
### Segmentacija na bazi regije
- Regijo definirajo piksli, ki ji pripadajo, opazujemo povezane nabore pikslov in jih skupaj oznacimo, za to poznamo 2 pristopa:
	- __Region growing:__ Zacnemo s piksom (semenom) in povezemo sosednje piksle, ki pripadajo ti regiji
	- __Split and merge:__ razdelimo, kar ne spada skupaj in te regije povzemo

Kaj pomeni, da so piksli __povezani?__ Dva piksla znotraj regije ali 2 majhna nabora pikslov sta povezana, ce obstaja vsaj ena pot po sosednjih piklslih ,ki pripadajo isti regiji
![[Pasted image 20241206141733.png]]
![[Pasted image 20241206141748.png]]
- Sosedje so direktno povezani
- Soseska je nabor sosedov

## Povezovanje povezanih komponent
1. Poskeniramo sliko po vrsticah, dokler ne pridemo do prvega piksla, ki ustreza nasemu pogoju pripadnosti in mu pripisemo vrednost razreda, ki mu pripada
2. Preverimo sosede tega prvega piksla, ce tudi oni pripadajo istemu razredu jim pripisemo vrednost
3. Spet zacnemo iskati sosede teh novo najdenih piklslov, ce pripadajo iskanemu razredu jim pripisemo vrednost, sicer pa nadaljujejmo skeniranje po vrsticah od zadnjega piksla, ki smo ga obdelali
	1. Tako dobimo vse sosede dolocenega piksla in _jih umestimo v zelejn razred_
4. Ponovno skeniramo, dokler ne zaznamo novega piksla, ki ustreza nasim pogojem. Ter okoli njega spet sprozimo rekurxivno iskanje sosedov, le da tokrat tem pikslom pripisemo drugo vrednost razreda, saj predstavljajo nov nabor sosednjih pikslov
Iz tega izhaja izraz flood fill ali colouring, saj pikslom iste pripisane vrednosti pripisemo isto barvo


## Morfolosko filtriranje
### Osnovne operacije:
#### Erozija in razsirjenje:
- __Erozija:__
	- regije na sliki se zmanjsajo
	- lahko pride do razbitja povezave
	- majhne regije lahko izginejo
![[Pasted image 20241206145347.png]]

- __Razsirjenje:__
	- regije na sliki se povecajo
	- locene regije se lahko povezejo
	- luknje v regijah se lahko zaprejo
![[Pasted image 20241206145532.png]]

_Erozija regije pomeni razsirjenje ozadja in obratno_

Pomembna stvar pri mofoloskih operacijah so morfoloski elementi, podobni jedru v konvoluciji

__Neformalna definicija erozije:__
- ce vsaj en piksel v soseski pripada ozadju, nanj postavimo morgfoloski element in na njem izvedemo operacijo erozije in celotno obmocje, ki ga pokriva filter postane ozadje
__Nefromalna definicija razsirjenja:
- Ce vsaj en element soseske pripada ospredju, postavimo nanj razsiritveni filter in celotno obmocje, ki ga filter pokriva postane del ospredja
![[Pasted image 20241206145949.png]]
![[Pasted image 20241206150034.png]]
![[Pasted image 20241206150242.png]]
#### Odpiranje in zapiranje
- __Odpiranje:__
	- Najprej opravimo erozijo, nato razsirjenje
	- S tem "zgladimo" originalni element v nekaj podobnega, vendar ne enakega
	![[Pasted image 20241206150540.png]]
	![[Pasted image 20241206150528.png]]

- __Zapiranje:__
	- Najprej opravimo razsirjenje, nato pa erozijo
	![[Pasted image 20241206150631.png]]
	
#### Hit or miss:
- Strukturni element se uporablja za dolocenje 2 pikslov, k morata pripadati ozadju, prav tako pa piksle, ki bi morali biti del ROI
- Operacija ima rezultat 1, le ce so vsi sosedje znotraj filtra pripadniki ROI
#### Tanjsanje:
- Vrne nam "okostje" regije, to so piklsi, ki lezijo na ROI in so ekvidistancni od vsaj 2 mejnih pikslov te regije
![[Pasted image 20241206151234.png]]
- Uporabljajo se npr za razpoznavanje prstnih odtisov
