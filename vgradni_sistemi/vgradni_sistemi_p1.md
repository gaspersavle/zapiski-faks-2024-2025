## Linux datotecni sistem
- osnovni objekt je _datoteka,:
	- Ime
	- atributi
	- vsebina
- Hierarhicno organiziran prek _direktorijev_, ki sluzijo kot nekaksni imeniki
- Pot do datoteke je sestavljena iz zaporedja imen direktorijev in imena datoteke
- Razlikujemo med _absolutnimi in relativnimi potmi_
- Skupine bajtov v pomnilniskem mediju grupiramo v t.i. _sektorje_
```
/
|-root/
|-etc/
|-dev/
|-lib/
|-usr/
|-bin/
|-home/
```
- _root_:
- _etc:_
	- Nastavitve sistemskih programov
- _dev:_
	- Dostop do perifernih naprav
- _lib:_
	- Sistemske knjiznice
- _usr:_
- _bin:_
	- Binarne programske datoteke
- _home:_
	- Domaci direktorij z uporabniskimi datotekami

## Upravljanje procesov
- Proces je *program v izvajanju*
- OS uporavlja vec procesov hkrati, nekateri od njih so aktivni, nekateri pripravljeni ali ustavljeni
- Kljucne funkcije:
	- Ustvarjanje
	- Razvrscanje
	- Preklop med procesi
- Razvrscanje s prevzemanjem je pomembno za real-time sisteme

### Struktura procesa
Proces sestavljajo:
- Ukazi
- Inizializirani podatki
- Neinicializirani podatki
- Kup (_heap_) za dinamicno dodeljevanje
	- Hrani 
- Sklad (_stack_) za klicne okvire
	- Hrani vse _ne-globalne spremenljivke_
	- Hrani naslove programov, ob _skoku v podprogram_ (ugnezdene funkcije)
	- Vsak proces ima svoj sklad

| $$\begin{gather}\text{Sklad} \\ \downarrow \\ \vdots \\ \uparrow \\ \text{Kup}\end{gather}$$ |
| :------------------------------------------------------------------------------------------: |
|                                   Neinicializirani podatki                                   |
|                                    Inicializirani podatki                                    |

### Medprocesne komunikacije
V vecprogramskem sistemu so procesi _loceno naslovnjeni_, vendar je med njimi potrebna komunikacija
Glavni obliki medprocesne komunikacije:
- _Skupni deljeni pomnilnik:_ Procesi berejo in pisejo v skupni del pomnilnika
- _Sporocilni sistem (message passing):_ Komunikacija preko posredovanja sporocilni
Sinhronizacija in usklajevanje procesov sta kljucni za pravilno delovanje

# Datotecni sistem
V linuxu velja kovencija _everything is a file_
V modernih operacijskih sistemih imamo datotecne sisteme z dnevnikom (_journaling filesystem_)

## Datoteka
- Osnovni element datotecnega sistema
- _Sekvencno zaporedje_ bajtov
- V UNIX sistemih je datoteka le _surovo zaporedje bajtov brez OS strukture_
- Do datoteke lahko dostopamo le z operacijami _branja in pisanja_
- Polozaj branja in pisanja doloca __datotecni kazalec__
- Kazalci so definirani relativno od zacetka datoteke

### Vrste datotek:
1. _navadne_: hranijo uporabne podatke
2. _posebne:_ omogocajo npr dostop do zunanjih naprav

### Direktoriji in hiererhicni sistem
Sodobni OS imajo _hierarhicno zgradbo datotek_
- Vsak direktorij lahko vsebuje navadne datoteke ali _poddirektorije_
- Datotetke so enoznacno dolocene s potjo
- 
