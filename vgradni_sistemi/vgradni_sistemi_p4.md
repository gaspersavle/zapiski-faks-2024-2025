#TODO ? - Navidezni pomnilnik

## Navidezni pomnilnik
Operacijski sistem posameznemu procesu dodeli _blok spomina_, ki mu pravimo `stran/page`, ki je velik 4kB.
Pomnilniku, ki je v _celoti razdeljen na strani_, pravimo __ostranjeni pomnilnik__. Za vsak porces je navedeno tudi, kje se nahaja (v pomnilniku ali na disku)

V pomnilinku so nalozeni le tisti deli programa, ki se trenutno izvajajo. Moramo "ugibati", kateri deli programa so pomembni


## Segmentiran pomnilnik
- Logicni prostor je razdeljen na __segmente,__ _ki so semanticno smiselni deli_:
	- Ukazi
	- Podatki
	- Sklad
	- ...
- Vsak segment je drugacne velikosti
- Logicni naslovi so sestavljeni iz 2 delov: `oznaka segmenta (s) | odmik (o)`
- V fizicnem pomnilniku se segment nahaja na _zveznem obmocju pomnika_
- Ko iskani segment _ni v pomnilniku_, pride do t.i. `segmentation fault`, OS nato nalozi zeleni segment
- V _segmentacijski tabeli_ se za vsak segment nahajata _naslov njegovega zacetka_ in njegova _velikost_


### Segmentiranje z ostranjenjem (paging)
- Segmentacijo in _stranjenje_ sta zdruzljiva koncepta. Pomnilnik se najprej segmentira, nato pa strani.
- Vsak segment se razdeli na _enako velike strani_
- Stani segmenta so _poljubno_ namescene  v fizicni pomnilnik
- Dodeljevenje pomnilnika na zahtevo je lahko: 
	- Na ravni _segmenta_, ce se celoten segment nahaja v pomnilniku (RAM)
	- Na ravni _strani segmenta_, ce je segment _stranjen_
- V praksi vecina arhitektur raje podpira _paging_
- Ostranjevanje je enostavneje delati sproti, ob dodeljevanju spomina
- Segmentiranje je prikladno za porogramerjan vendar je _kompleksnejse_

## Upravljenje pomnilnika in linux
- Ker linux cilja na prenosljivost (deluje na vsem) in vse moderne arhitekture podpirajo stranjenje, linux temelji na _ostranjenem sistemu_
- Pogosta je __vecnivojska__ organizacija tabel strani
- 32b sistemi s 4kB stranmi bi potrabovali 20 bitov za _naslavljanje strani_, zato uporabljamo vecjo tabelo _razdeljeno na manjse_
- Mehanizem `copy on write` (COW) je poseben pristop, dokler stran ni pisana, vec procesov lahko _deli isto fizicno stran_
- Ob prvem pisanju se stan _kopira_, **proces pa dobi lastno kopijo**

- Vse te leastnosti omogocajo:
	- Dobro izrabo pomnilnika
	- Hitro ustvarjanje procesov
	- Vernost in izolacijo
- Koncept je na razlicnih arhitekturah _podoben_, s strojno podporo za paging

