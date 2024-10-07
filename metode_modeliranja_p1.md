# Uvod
Kaj je treba vedeti da inverzno nihalo drzimo v pokoncnem polozaju:
- Gre za __nestabilen sistem__, za katerega potrbujemo kompleksnejsi sistem vodenja
- Nacrtovanje vodenja temelji na ustreznih matematicnih modelih

## Kako zagotoviti ustrezno predelavo nafte?
Dolocevanje ustreznih temperatur za doseganje ustreznih frakcij .
Dejanska izgradnja procesa temelji na matematicnih izracunih oz. modelih

## Kaksno ogravanje oziroma hlajenje naj namestimo v hiso in kako naj sistem deluje, da bo rabvno prav toplo

Pri ogrevanju in hlajenju gre za enostavnejsi proces, kot v prejsnjih primerih, vendar so prav tako velikokrat pomebni:
- izracuni glede dimenzioniranja sistema
- izracuni o primerni postavitvi grelnih/hladilnih teles
- izracuni o vplivu zunanjih in notranjih faktorjev

## Kako se bo letalo obnasalo v zraku?
Pri konstrukciji novih letal si je potrebno zastaviti naslednja vprasanja:
- ali bo letalo v zraku stabilno?
- kaksne hitrosti lahko doseze?
- kako strmo se lahko vzpenja?
- kako velika je dvizna sila na letalo ob manevrianju?
Odgovore na ta vprasanja lahko dobimo na 2 nacina , in sicer z izgradnjo fizicnega ali matematicnega modela

Modela se lahko lotimo fizicno ali matematicno, vsak od teh pristopov ima svoje prednosti in slabosti.

1. Fizicni model (slabosti):
	1. terja veliko casa
	2. natancno delo
	3. meterialni stroski
	4. casovno zamudno
	5. rezultati so poznani samo v tockah, kjer smo izvedli poskuse in meritve
2. Matematicni model (prednosti):
	1. relativno enostavno
	2. hitro
	3. poceni
	4. omogoca dober pogled na vpliv posameznih velicin

1. Fizicni model (prednosti):
	1. omogoca natancnejse poskuse, posebej ce imamo opravka s sistemom za katerega ni predhodnega znanja in informacij
	2. omogoca prilagoditve strukture sistema in njihovo testiranje
	3. mogoca dostop do pravih podatkov o delovanju sistema
2. Matematicni model (slabosti):
	1. lahko je izredno zahtevna naloga
	2. je lahko povezana s poenostavitvami ali neznanimi sistemi, ki vplivajo na tocnost modela
	3. je lahko nemogoca zaradi neraziskanosti ali nepoznanja fizikalega ozadja sistemov
## Dodatna vprasanja:
- kako predvideti _prodajo dolocenega_ izdelka
- kako se razvija _epidemija_ dolocene virusne bolezni
- kako oceniti _velikost populacije_ v naslednjih letih
- kako opazovati _obnasanje posameznikov (agentov)_ v doloceni populaciji

# Kaj je sistem
Sistem je _mnozica elementov_, ki so medsebojno povezani in dleujoci kot neka celota, imajo medsebojne relacije in relacije z okoljem

![[Pasted image 20241004114451.png]]

Sistem predstavlja __vec kot zgolj vsota posameznih komponent__. To, kar je vec, ni rezultat ene posamezne komponente, ampak nacina povezav med njimi, ki rezultira v sinergiji. Ta sinergija pomeni kvaliteto in kvantiteto.

# Kaj je proces
Proces je __dogajanje__, ki povzroci v sistemu _prehodni pojav_, oziroma spremembo stanja sistema

![[Pasted image 20241004114837.png]]

Ko govorimo o procesu, je torej kljucna kompnenta __cas__, saj samo na osnovi opazovanja nekega sistema v razlicnih casovnih trenutkih, lahko opazimo spremembo stanja

_Sistem je torej okvir, znotraj katerega potekajo_ __procesi__

# Kaj je eksperiment ali poskus
Poskus je dogajanje oz. proces, s pomocjo katerega zbiramo podatke o sistemu. Zelo pogosto izvajanje poskusa pomeni, da opazovani sistem nekako vzbujamo. (npr. s primernimi vhodi in zacetnimi stanji) in opazujemo izhode. __Merimo__

Vcasih lahko merimo tudi dolocene notranje velicine sistema

# Kaj je model
Objekt ali koncept, ki  ga lahko uporabimo za prikaz dolocenih znacilnosti ali lastnosti sistema, ki so za uporabnika pomembne.

Model je nekaj drugega, kot sistem sam. Sluzi kot surogat realnosti, ki je prenesen v neko uporabno in razumlivo obliko. Omogoca razumevanje in razlago lastnosti sistema, poseldicno pa tudi ugotavljanje, kako sistem spremeniti, ce z delovanjem nismo zadovoljni

Popolna slika (model) sistema realnih sistemov __ne obstaja__

# Kaj je modeliranje

Postopek izdelave/gradnje modelov. Vecinoma se bomo posvecali izdelavi matematicnih modelov

# Kaj je simulacija

__Numericno resevanje__ matematicnih modelov. Pomeni, da na numericen nacin izracunamo odziv matematicnega modela pri izbranem vzbujanju

Recemo lahko tudi, da s simulacijo izvajamo eksperimente na modelih.

# Razlogi za gradnjo modelov

1. Izboljsanje poznavanja in razumevanja obravnavanega sistema
2. Napoved obnasanja sistema v rzlicnih okoliscinah
3. Omogocanje nacrtovanja sistemov vodenja in jihovega vrednotenja
4. Oceniti parametre sistema ki niso merljivi
5. Preizkusiti obcutljivost sistemskih parametrov
6. Optimizacija obnasanja sistema
7. Omogoca ucinkovito odkrivanje napak v sistemu
8. Omogocanje raziskave primerov, ki bi bili v realnem svetu dragi, tegani ali problematicni, kar je pomebno tuidi pri simulacijah za ucenje operaterjev

# Pristopi k gradnji modelov

![[Pasted image 20241004121208.png]]
- spadajo v skupino _dobro raziskanih sistemov_ (levi del na zgornji sliki)
- gradnjo matematicnih modelov temeljimo na _ze odkritih zakonitostih_ (ravnoteznih zakonih)
- upostevanje ze velikokrat preverjenih, in na razlicne nacine dokazanih zakonitosti omogoca v splosnem tudi _vecje zaupanje v uporabo modela_

Ko se premikamo v podrocje manj poznanih sistemov, imamo na voljo vse manj informacij o posameznih zakonitostih in je zato jasno, da je _zanesljivost interpretacije_ tovrstnih modelov vse tezja in _bolj problematicna_


#TODO

# Ciklicni postopek modeliranja
![[Pasted image 20241004124207.png]]