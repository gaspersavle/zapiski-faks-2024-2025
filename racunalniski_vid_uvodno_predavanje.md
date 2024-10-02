# Stvarjenje slike
Kompleksen proces z velikimi faktorji, kot so:
1. Geometrijske lastnosti
	1. svetloba, objekt, kamera
	2. aranzma svetlobe, kamere in telesa
2. Radiometricne/fotometricne lastnosti
	1. propagacija svetlobe
	2. brez svetlobe ni slike
Zanima nas mapiranje iz 3D v 2D svet

Slika je mapiranje 3D prizora na 2D ravnino
_Lastnosti:_
- Kvantizirana 2D slikovna ravnina
- Sestavljena iz diskretnih elementov/pisklov
- Matrika stevil, ki predstavljajo svetlosti posameznega piksla
# Osnovni tipi slik
1. Crno-bele;
	1. nabor nicel in enic
2. Sivinske
	1. Nabor svetlosti posameznega piskal
3. Barvna slika
	1. najpogosteje uporabljena je RGB
	2. Lahko smatramo kot 3 2D nabore, za vsak posamezen kanal

# Osnovni koncepti in lastnosti slik
Pri obdelavi slik razporedimo slio na vec obmocij:
1. Region of interest (ROI) je del slike, ki nas zanima, kjer se nahaja informacija,, ki jo zelimo obdelati
2. Soseska piksla, ki nas zanima (vedno lihe dimenzije)

# Koordinate slik
Izvor slike je vecinoma umescen v zgornji levi kot slike (koordinate 0,0)
V matlabu so slike oznacene kot matrike, torej $VRSTICA \cdot STOLPEC$

# Geometrijski model kamere
- model camere obscure za perspektivno projekcijo na senzor kamere
$$x = -f \frac{X}{Z}\quad y = -f\frac{Y}{Z}$$
Kjer x in y pomenita koordinate prijekcije, X in Y pa koordinato v resnicnem svetu

Zavoljo matematicne enostavnosti poenostavimo model kamere, tako, da senzor kamere prestavimo pred gorisce, kar rezultira v spodnji konfiguraciji.

![[Screenshot from 2024-10-02 10-44-14.png]]

## Osnovne lastnosti perspektine projekcije
- Ravne crte ostanejo ravne
- Vzporedne crte konvergirajo v beziscni tocki
- Koti med crtami se ne ohranjajo
- Razdalje se ne ohranjajo