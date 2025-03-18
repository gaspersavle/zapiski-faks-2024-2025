# 1. Kalibracija s toolboxom

1. _Zakaj sploh ocenjujemo opticno sredisce (principal point)? Zakaj ni vedno kar v srediscu slike?_

- **Neidealna optika:** Pri izdelavi lec in namestitvi senzorja so lahko prisotne majhne mehanske napake, zaradi katerih je opticna os rahlo zamaknjena glede na središče slike.
    
- **Namestitev senzorja:** Ce senzor ni popolnoma poravnan z opticno osjo, se opticno sredisce premakne.
    
1. _V kaksnih enotah je podana goriscna razdalja, zakaj ima dve komponenti, in kako bi jo preracunali v milimetre?_

- **Različna velikost pik v horizontalni in vertikalni smeri:** Pri številnih senzorjih niso nujno enake velikosti pik v obeh smereh, saj lahko fizične lastnosti senzorja in način njegove izdelave povzročijo razliko v gostoti pik horizontalno in vertikalno. Zaradi tega so optične projekcije in goriščna razdalja različne v vsaki smeri, zato potrebujemo fxf_xfx​ za horizontalno in fyf_yfy​ za vertikalno komponento.
    
- **Preprostejše modeliranje popačenj in kalibracija:** Pri kalibraciji kamere, kjer določamo model projiciranja točk iz prostora na senzor, je uporaba dveh komponent goriščne razdalje bolj natančna, saj omogoča prilagoditev za morebitne neskladnosti v povečavi ali popačenju slike.

1. _Kaj so elementi vektorja distorzije, ki jih izracuna toolbox?_

- __Prvi 3 elementi so koeficienti radialne distorzije, druga 2 pa koeficienta tangencialne distorzije

## Rezultati kalibracije
| Originalna slika | Popravljena slika    |
| ---------------- | -------------------- |
| ![[Image4.tif]]  | ![[Image_rect4.tif]] |
| ![[Image2.tif]]  | ![[Image_rect2.tif]] |
| ![[Image6.tif]]  | ![[Image_rect6.tif]] |
| ![[Image9.tif]]  | ![[Image_rect9.tif]] |
| ![[Image1.tif]]  | ![[Image_rect1.tif]] |
# 2. Projektiva transformacija
