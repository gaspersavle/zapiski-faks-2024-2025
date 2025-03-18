
iMehanske sisteme lahko modeliramo z uporabo lagrangejeve enacbe
$$\begin{gather}
\frac{d}{dt}(\frac{dL}{d\dot q})-\frac{dL}{dq_s}+\frac{dP}{d\dot q_s} = F_s \\
P = \frac{1}{2}R\dot q_s^2
\end{gather}$$
Kjer so:
- $q_s$ posplosena koordinata
- $L = T_K - V_p$ lagrangeeva funkcija
- $T_K$ kineticna energija sistema
- $V_P$ potencialna energija sistema
- $p$ mocnostna funkcija
- $tj$ izguba energije
- $R$ kosntanta dusenja
- $F_s$ zunanje vzbujanje v smeri posplosene koordinate
#TODO insert klobasa od izpeljave
__Oblike Lagrangeeve enacbe:__
1. Za sisteme, ki porabljajjo energijo
$$\frac{d}{dt}(\frac{\partial T_k}{\partial \dot q_s})-\frac{\partial T_K}{\partial q_s} = F_s$$
2. Za sisteme ki ne porabljajo energije (konzervativne sisteme)
$$\frac{d}{dt}(\frac{\partial T_K}{\partial \dot q_s})-\frac{\partial T_K}{\partial q_s}+\frac{\partial V_p}{\partial q_s} = 0$$
$$\color{red} Lagrangeva\space formula: L = T_k - Vp \mapsto T_k = L + V_p$$

$$\frac{d}{dt}(\frac{\partial (L+ V_p)}{\partial \dot q_s})-\frac{\partial (L + V_p)}{\partial q_s}+\frac{\partial V_p}{\partial q_s} = 0$$
3. Oblika:
$$\frac{d}{dt}(\frac{\partial L}{\partial \dot q_s})-\frac{\partial L}{\partial q_s} = 0$$

4. Oblika:
$$\frac{d}{dt}(\frac{\partial L}{\partial \dot q_s})-\frac{\partial L}{\partial q_s}+\frac{\partial P}{\partial \dot q_s} = 0$$
5. Oblika:
$$\frac{d}{dt}(\frac{\partial L}{\partial \dot q_s})-\frac{\partial L}{\partial q_s}+\frac{\partial P}{\partial \dot q_s} = F_s$$

__Primer za sistema klade in vztrajnika:__
1. Izberemo vhod in izhod sistema:
$$q_s = \Phi$$
2. Izrazimo kineticno energijo sistema:
$$T_k = \frac{1}{2}mv^2 + \frac{1}{2}J\omega^2 = \frac{1}{2}m\dot x^2 + \frac{1}{2}J\phi^2 = \frac{1}{2}mr^2\dot\phi^2 + \frac{1}{2}J\dot \phi^2 = \frac{1}{2}(J+r^2m)\dot\phi^2$$
3. Izrazimo potencialno energijo sistema
$$V_p = \int_0^x F dx = \int_0^x kxdx = \frac{1}{2}kx^2$$
$$V_p = \frac{1}{2}k r^2\phi^2$$
4. Izrazimo mocnostno funkcijo:
$$P = \frac{1}{2}f_1\cdot \dot \phi^2 + \frac{1}{2}f_2\cdot \dot x^2 = \frac{1}{2}[f_1+r^2\dot f_2]\cdot \dot \phi^2$$
5. Zapisemo Lagrengeevo funkcijo:
$$L = T_k + V_p =\frac{1}{2}(J+r^2m)\dot\phi^2 -\frac{1}{2}k r^2\phi^2$$
