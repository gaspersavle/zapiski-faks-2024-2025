# Predstavitve modelov dinamicnih sistemov in transformacije med njimi ter njihova analiza in simulacija
Namen sklopa:
- Opisati najpomembnejse predstavitve zveznih dinamicnih modelov v inzenirski praksi
- Prikazati prehode med njimi
- Nanizati najpomembnejse lastnosti, ki jih lahko razberemo ob opazovanju podanih predstavitev
- Presdtaviti orodja za analizo dinamicnih modelov v matlabu, s katerim si olajsamo o,menjene izracune
## Predstavitve zveznih dinamicnih modelov
- __Matematicni modeli__
	- diferencialne enacbe
	- prenosne funkcije
	- prostor stanj
- __Graficne predstavitve__
	- Blocni diagrami
	- Simulacijske sheme
## Diferencialne enacbe
Diferencialne enacbe predstavljajo enega od osnovnih zapisov dinamicnega sistema in dolocajo kako se spreminjajo odvodi stanj sistema v odvisnosti od vhodov, izhodov, motenj in samih stanj sistema

![[Pasted image 20241008132810.png]]

__Linearna casovno nespremenljiva diferencialna enacba:__
$$y^{(n)}(t) + a_{n-1} y^{(n-1)}(t) + \cdots + a_1 \frac{dy(t)}{dt} + a_0 y(t) 
= b_m u^{(m)}(t) + b_{m-1} u^{(m-1)}(t) + \cdots + b_1 \frac{du(t)}{dt} + b_0 u(t)
$$

Kjer:
- __n__ pomeni red sistema
- __n >= m__ pomeni vzrocnost sistema, torej red izhoda mora biti visji od reda vhoda
- __n-m__ pomeni relativni red sistema, torej razlika med redom izhoda in vhoda formule
## Prenosne funkcije
Prenosna funkcije linearnega, casovno nespremenj=ljivega sistema je definirana kot kvocient transformirank izhodnega in vhodnega signala izbranega linearnega sistema, npr. Laplacovih transformirank, z-transformirank, pri zacetnih pogojih, ki so enaki 0
![[Pasted image 20241008133310.png]]

$$\frac{y(s)}{u(s)} = G(s) = \frac{b_m s^m + b_{m-1} s^{m-1} + \cdots + b_1 s + b_0}{s^n + a_{n-1} s^{n-1} + \cdots + a_1 s + a_0}
$$
_Ali lahko v obliki prenosne funkcije zapisemo nelinearni sistem?_
- Ne, prenosne funkcije lahko opisejo le linearne sisteme
_Kaj pa casovno spremenljiv sistem?_
- Ne, v razlicnih primerih dobimo razlicne prenosne funkcije
_Lahko definiramo nicelne pogoje?_
- Ne, ker opisuje zgolj sam sistem, zacetne pogoje moramo dolociti naknadno
_Zakaj dinamiko sistema zapisujemo v obliki prenosne funkcije_
- Dinamiko sistema radi zapisujemo s prenosno funkcijo, ker nazorno opise dinamicen odnos med vhodno in izhodno spremenljivko sistema

### Transformacija diferencialne enacbe v prenosno funkcijo
![[Pasted image 20241008133815.png]]
1. Zacnemo iz diferencialne enacbe
2. Naredimo Laplacovo transformacijo celotne enacbe in privzamemo nicelne zacetne pogoje
3. Izpostavimo laplacovo transformiranko vhoda in izhoda
4. Enacbo napisemo v obliki kvocienta $\frac{y(s)}{u(s)} = G(s)$
$$$$

### Oblike zapisov prenosne funkcije in pogosti izrazi
1. Polinomska oblika:
$$\frac{y(s)}{u(s)} = G(s) = \frac{b_m s^m + b_{m-1} s^{m-1} + \cdots + b_1 s + b_0}{s^n + a_{n-1} s^{n-1} + \cdots + a_1 s + a_0}
$$
2.  Faktorizirana oblika:
$$\frac{y(s)}{u(s)} = G(s) = \frac{k(s + z_1)(s + z_2) \cdots (s + z_m)}{(s + p_1)(s + p_2) \cdots (s + p_n)}
$$
3. Bodejeva oblika :
$$\frac{y(s)}{u(s)} = G(s) = \frac{K_s (c_1 s + 1)(c_2 s + 1) \cdots (c_m s + 1)}{(\tau_1 s + 1)(\tau_2 s + 1) \cdots (\tau_n s + 1)}
$$

__Koreni imenovalca prenosne funkcije so POLI sistema, koreni stevca pa so NICLE sistema__

## Prostor stanj
Prostor stanj je zapis dinamicnega sistema v obliki:
$$\dot x(t) = Ax(t) + Bu(t)$$
$$y(t) = Cx(t) + Du(t)$$
Pri cemer je:
- __u(t)__ vektor vhodov ($m\times1$, kjer je m stevilo vhodov)
- __y(t)__ vektor izohodov ($l \times 1$, Kjer je l stevilo izhodov)
- __x(t)__ vektor stanj (notranjih spremenljivk sistema, $n\times1$, kjer je n red sistema)
- __A, B, C, D__ matrike ustreznih dimenzij

_Ali lahko s prostorom stanj opisemo nelinearni sistem?_
- Lahko, vendar se formula nekoliko spremeni, saj dinamika sistema ni vec opisana z linearnimi, ampak z nelinearnimi enacbami
_Kaj pa casovno spremenljivi sistem?_
- Lahko, vendar morajo biti matrike parametrov sistema tudi casovno odvisne, npr,:
$$A(t)\quad B(t) \quad C(t) \quad D(t)$$
_Lahko v prostoru stanj definiramo zacetne pogoje?_
- Lahko, podani so v obliki $x(0) = x_0$
_Zakaj dinamiko sistema zapisujemo v prostoru stanj?_
- Prostor stanj omogoča opis **linearnih** in **nelinearnih** sistemov ter **časovno spremenljivih** in **časovno nespremenljivih** sistemov. Prav tako je uporaben za **več vhodno-več izhodne sisteme (MIMO)**, kar pomeni, da lahko obravnava sisteme z več vhodi in več izhodi, kar je težko z drugimi metodami, kot je na primer prenosna funkcija.
### Pretvorba diferencialne enacbe v zapis prostora stanj
Obstajata __2 razlicna nacina pretvorbe DE v prostor stanj:__
1. Diferencialna enacba ne vsebuje odvodov vhodnega signala
2. Diferencialna enacba vsebuje odvode vhodnega signala
#### Diferencialna enacba ne vsebuje odvodov vhodnega signala:
![[Pasted image 20241008135539.png]]
$$y^{(n)}(t) + a_{n-1} y^{(n-1)}(t) + \cdots + a_1 \frac{dy(t)}{dt} + a_0 y(t) = b_0 u(t)
$$
Vpeljemo nove oznake spremenljivk, ki jih imenujemo __stanja sistema:__
$$\begin{gather}
x_1(t) = y(t) \\
x_2(t) = \dot y(t) \\
x_3(t) = \ddot y(t)\\
\vdots \\
x_n(t) = y^{(n-1)}(t)
\end{gather}$$
Zapis preuredimo v vektorsko-matricno obliko:
- Spremenljivka $x_1(t)$ predstavlja odvisno spremenljivko $y(t)$:
$$x_1(t) = y(t)$$
- Ostale spremenljivke $x_i(t)$ predstavljajo odvode odvisne spremenljivke $y(t)$
$$\begin{gather}
\dot x_1(t) = x_2(t)\\
\dot x_2(t) = x_3(t)\\
\dot x_3(t) = x_4(t)\\
\vdots \\
\dot x_n(t) = -a_0x_1(t) - a_1x_2(t)- \cdots - a_{n-1}x_n(t) + b_0u(t)
\end{gather}$$
- Spremenljivke $x_1(t)$, ki predstavljajo stanja uredimo v vektor in vse skupaj zapisemo v obliki zapisa prostora stanj
$$\begin{bmatrix}
\dot x_1(t)\\
\dot x_2(t)\\
\vdots\\
\dot x_n(t)
\end{bmatrix} = 
\begin{bmatrix}
0 &&1 &&0 && \cdots &&0\\
0 &&0 &&1 && \cdots &&0\\
\vdots && && && \ddots &&\\
-a_0 && -a_1 && -a_2 &&\cdots && -a_{n-1}
\end{bmatrix}
\begin{bmatrix}
x_1(t)\\
x_2(t)\\
\vdots\\
x_n(t)
\end{bmatrix}+
\begin{bmatrix}
0 \\ 0 \\ \vdots \\ b_0
\end{bmatrix}u(t)$$
$$y(t) = \begin{bmatrix}1&&0&&0&&\cdots&&0\end{bmatrix}\begin{bmatrix}x_1(t)\\x_2(t)\\ \vdots \\ x_n(t)\end{bmatrix} + [0]u(t)$$
#HOMEWORK
