## Deskriptorji 2D objektov
### Tezisce
#TODO 
### Momenti
- Statisticni momenti, kjer X in y vrednosti obravnavamo kot nakljucne spremenljivke
$$m_{pq} = \sum_{x,y} x^p y^q f(x,y)$$
- Centralni momenti so momenti, ki jih potegnemo iz [[racunalniski_vid_p8#Tezisce | centroida]], uporabljamo jih za dolocitve orientacije, normalizacijo...
### Kompaktnost
$$kompaknost = obseg^2/ploscina$$
![[Pasted image 20241211092651.png]]

### Ekscentricnost
$$ekscentricnost = daljsa \space os / krajsa \space os$$
![[Pasted image 20241211092743.png]]

### Oblika iz konture
- Zvijalna energija:
$$BEN = \int_s k^2(s)ds$$
$$k = \frac{1}{r} = \left|\frac{dT}{ds} \right| = \frac{\dot x \ddot y - \ddot x \dot y}{\sqrt{(\dot x^2 + \dot y^2)^3}}$$
Kjer so:
- k : ukrivljenost
- r : radij oscilirajocega kroga
- dT : tangent vector

# Poravnava in ujemanje slik
## Geometrijske transformacije slik
- Transformacije ki smo jih ze obravnavali (filtriranje...) operirajo z vrednostmi pikslov
![[Pasted image 20241211093940.png]]

- Geometricne transformacije za razliko od njih operirajo s polozaji pikslov

![[Pasted image 20241211094042.png]]
