# Uvod
Sestavni deli vgradnega sistema:
- Namenska strojna oprema
- Namenska programska oprema
- Osnovne  _podporne enote_ (bootloader...)
Namen operacijskega sistema je, da nudi _abstrakcijo_ med sistemi, kar nam omogoce, da _ne podvajamo dela za razlicne naprave_

# Kaj je operacijski sistem
- Skrbi da se vse dejavnosti izvajajo pravilno in ucinkovito
- Ustvarja abstrakcijo nad strojno opremo, ne glede na strojno opremo, lahko programi na enak nacin upravljajo z njo
-  najosnovnejsem smislu predstavlja _sistemsko jedro/kernel_, ki je ves cas namesceno v pomnilniku
OS vkljucuje tudi sistemske knjiznice, orodja kot so _shell_, ter celotno distribucijo

Skrbi za:
- uporavljanje procesov (process management)
- upravljanje pomnilnika (memory management)
- upravljanje vhodno/izhodnih porcesov in datotecnega sistema
Vsak sistem hkrati _izvaja vec procesov_ in mora zagotavljati _predvidljivo in pravocasno odzivanje_ na zunanje zahteve

## Sestava operacijskega sistema
- __Jedro/kernel:__ stalno namesceno v pomnilniku, skrbi za osnovne funkcije, kot so uporavljanje procesov, pomnilnika, itd
- __Sistemskih knjiznic/ukazov:__ Zagotavljajo funkcije, s katerimi uporabniski programi komunicirajo z jedrom
- __Distribucije:__ Celoten sistem, pripravljen za uporabo, ki poleg jedra vsebuje tudi dodatne pakete, kot so _graficna okolja, razvojna orodja..._

## UNIX/GNU/Linux
- UNIX je bil pionir operacijskih istemov, ki je oblikoval sodobne standarde
- GNU projekt in _odprtokodna filozofija_ so privedli do nastanka Linuxa
- Linux se uporablja v stevilnih napravah, od osebnih racunalnikov do vgradnih sistemov
