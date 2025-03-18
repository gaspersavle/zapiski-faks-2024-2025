## Maximum likelyhood
- statistical method
- Selects a parameter estimate thet will _maximise the likelyhood_ of a certain measurement
- A _likelyhood function_ $p(y|\theta)$ has to be defined
- We are looking for a _parameter vector_ that _maximises the likelyhood function_
- Recursive and non-recursive methods exist
	- Both are _iterative_
- Complicated derivation of the algorithm
- Simple implementation, first we must define _filtered signals_: $$\begin{align}
\mathbf{y}_f(k) &= \mathbf{y}(k) - \hat{d}_1\mathbf{y}_f(k-1) - \cdots - \hat{d}_n\mathbf{y}_f(k-n) \\
u_f(k) &= u(k) - \hat{d}_1u_f(k-1) - \cdots - \hat{d}_nu_f(k-n) \\
e_f(k) &= e(k) - \hat{d}_1e_f(k-1) - \cdots - \hat{d}_ne_f(k-n) \\
\Phi^T(k) &= \left[-\mathbf{y}_f(k-1), \ldots, -\mathbf{y}_f(k-n), u_f(k-d-1), \ldots, u_f(k-d-n), e_f(k-1), \ldots, e_f(k-n)\right]
\end{align}$$
the filtered signals are gathered in the $\mathbf{\Phi^T}$ matrix
## Instrumental variables
- The classical LS method only gives _bias free_ estimates if the _cross corelation iz zero_ form positive argument values
	- It only wirks if the noise is white
- The instrumental variables method supresses bias by replacing measured output values (corrupted by noise) with so-called __instrumental variables__ $x$:
	- They are not _correlated with noise_
	- They are _highly correlated with $y$_
- Providess unbiased estimates with an arbitrary form of the noise filter, but *only retains local stability*
- #TODO 151-153

## Method od stochastic approximation (STA)
- Uses gradient descent for _cost function minimisation_ $$V(k+1) = \frac{1}{2} e^2 (k+1)$$
	- The cost function only takes into account the _current equation error_ $$e(k+1) = y(k+1)-\Psi^T(k+1)\hat{\theta}(k)$$
	- Gradient descent gives new parameter estimates in the direction of the _steepest_ descent of the cost function 
$$\hat{\theta}(k+1) = \hat{\theta}(k) - \rho(k+1) \frac{d}{d\hat{\theta}(k)} V(k+1)$$
- Parameter corrections are updated according to: $$\begin{gather}
\hat{\theta}(k+1) = \hat{\theta}(k) + \rho(k+1) e(k+1) \psi(k+1)= \\
= \hat{\theta}(k) + \rho(k+1) \psi(k+1) \left[ y(k+1) - \psi^T(k+1) \hat{\theta}(k) \right]\end{gather}
$$

- The algorithm is similar to [[identifikacija_p4#Recursive leas squares (RLS) method|recursive least squares (RLS)]] but instead of using the covariance matrix in the gein update, we use _the scalar $\rho$_
- The method _converges_ when the _following requirements for  $\rho$ are met:_ $$\lim_{k \to \infty} \rho(k) = 0 \quad \sum_{k=1}^{\infty} \rho(k) = \infty \quad \sum_{k=1}^{\infty} \rho^2(k) < \infty$$
- Possible choices for $\rho(k)$ are:
	- $\rho(k) = \frac{1}{k}$
	- $\rho(k) = tr\{\mathbf{P}(k)\}$ (we can see how the matrix trace is calculated _recursively_) $$\rho^{-1}(k+1) = \rho^{-1}(k) + \psi^T(k+1) \psi(k+1), \quad \rho^{-1}(0) = 0$$
- STA is _less computationaly demanding_ than standard RLS, but also provides lower partial convergence

## Parameter estimation – continuous-time processes
- We are motivated to estimate continuous systems due to _their parameters having physical meaning_ such as time constant, frequency, damping...
- Discrete systems are nonlinear mappings of continuous ones so their interpretation is much more difficult, making them harder to validate
- Continuous-time transfer function of the process
$$
G_p(s) = \frac{Y(s)}{U(s)} = \frac{b_0 + b_1s + \dots + b_n s^n}{1 + a_1s + \dots + a_n s^n}, \quad a_n \neq 0
$$

- The system described in the form of a differential equation
$$
\sum_{i=0}^{n} a_i \frac{d^i}{dt^i} y(t) = \sum_{i=0}^{n} b_i \frac{d^i}{dt^i} u(t), \quad a_0 = 1
$$

- Expressing $y(t)$ from the above differential equation
$$
y(t) = -a_1 \frac{d}{dt} y(t) - \dots - a_n \frac{d^n}{dt^n} y(t) + b_0 u(t) + b_1 \frac{d}{dt} u(t) + \dots + b_n \frac{d^n}{dt^n} u(t)
$$

- Key Observation
	- Right-hand side can be written as a product between:
	- *Vector of regressors* (holding measured signals and their derivatives)
	- *Parameter vector*

- BUT:
	- The *derivatives are not measurable*.
	- Their *approximations amplify noise*, leading to *identification results deterioration*.

- An alternative solution is to introduce *state variable filters*:
	- Low-pass filter that *dampens out the high-frequency noise* on $u$ and $y$.
	- Transforms the system into a *state-space representation*.

- The idea:  
	$u(t) \xrightarrow{G_f(s)} u_f(t)$ and $y(t) \xrightarrow{G_f(s)} y_f(t)$  
	- The *transfer function between original signals* is the same as the *transfer function between the filtered signals* for any filter $G_f(s)$.

- The *difference between the orders* of the denominator and numerator of $G_f(s)$ must be *higher (or equal) than the process order* $n$.

- *Simplest choice* – denominator order is $n$, numerator order is 0:
	$$
	G_f(s) = \frac{1}{f_0 + f_1s + \dots + f_n s^n}, \quad f_n \neq 0
	$$

- *Laplace transform of filtered input and output*:
	$$
	U_f(s) = G_f(s) U(s), \quad Y_f(s) = G_f(s) Y(s)
	$$
![[Pasted image 20250317100943.png]]

- The relation between *filtered signals* is the same as the relation between *original signals*:
  $$
  \frac{Y_f(s)}{U_f(s)} = \frac{G_f(s) Y(s)}{G_f(s) U(s)} = \frac{Y(s)}{U(s)} = G_p(s)
  $$

- *Description in the form of a differential equation*:
  $$
  y_f(t) = -a_1 \frac{d}{dt} y_f(t) - \dots - a_n \frac{d^n}{dt^n} y_f(t) + b_0 u_f(t) + b_1 \frac{d}{dt} u_f(t) + \dots + b_n \frac{d^n}{dt^n} u_f(t)
  $$
  - The *differential equation between filtered signals* has the *same structure* and the *same parameters* as the original differential equation.

- A *new vector of estimated parameters* is introduced together with the *corresponding vector of regressors*:
  $$
  \theta^T = [a_1 \quad \dots \quad a_n \quad b_0 \quad b_1 \quad \dots \quad b_n]
  $$
  $$
  \psi^T(t) = \left[ -\frac{d}{dt} y_f(t) \quad \dots \quad -\frac{d^n}{dt^n} y_f(t) \quad u_f(t) \quad \frac{d}{dt} u_f(t) \quad \dots \quad \frac{d^n}{dt^n} u_f(t) \right]
  $$
  $$
  y_f(t) = \psi^T (t) \theta
  $$
- What follows is a standard parameter estimation procedure
- There are recursive and non-recursive methods available
	- __Non-recursive:__
		- From $N$ observations at times $t_1,t_2, \cdots, t_n$, we construct
		- The $\mathbf{\Psi}$ matrix. In its $i$-th row, there is the row vector $\mathbf{\Psi}^T(t_i)$
		- The $\mathbf{y}$ vector, which has the scalar $y_i(t_i)$ in the $i$-th row

# Identification of non-parametric models
- Based on the following schematic:
![[Pasted image 20250317103416.png]]
- Which shows the relations between process signals, their Fourier trnasforms, signal correlations, spectra and non-parametric models

## Empirical transfer function estimation (ETFE)
- Its the _most direct_ and obvious non-parametric identifiacation method. 
- Its the calculation of frequency respo se based on division of Fourier transforms of input and output signals
![[Pasted image 20250317103649.png]]
- Most often, _periodic signals are used_

### ETFE - Fourier transform of simple signals
1. __Example:__ Trapezoidal pulse
	- *Trapezoidal pulse*, where $T_p$ is the length, $T_1$ is the rise time and $T_2$ is the time where it starts to descend $$U_{tra}(j\omega) = U_0 T_2 
\left[ \frac{\sin \frac{\omega T_1}{2}}{\frac{\omega T_1}{2}} \right] 
\left[ \frac{\sin \frac{\omega T_2}{2}}{\frac{\omega T_2}{2}} \right] 
e^{\frac{j\omega T_p}{2}}$$
	- This spectrum has zeros where the argument of the $\sin$ component reaches a value which is _a multiple of_ $\pi$: $$\begin{gather}
\frac{\omega_{1n} T_1}{2} = n\pi \text{ or altern.}, \quad f_{1n} = \frac{n}{T_1} \\
\frac{\omega_{2n} T_2}{2} = n\pi \text{ or altern.}, \quad f_{2n} = \frac{n}{T_2} \\
n = 1,2,3 \dots
\end{gather}$$
	![[Pasted image 20250318132547.png]]
2. __Example:__ Rectangular pulse
	- 
#TODO 166,167

### ETFE - identification procedure
- An appropriate range of excitation frequencies is estimated
	- Always include _natural frequencies of the process_ (defined by dominant time-constants)
	- The estimated frequency response error will be _large around frequencies with no or low excitation_
	- A too large excitation frequency band is not good because the _over-all power_ is usualy _limited_ and _not enough power is left for_ __"important frequencies"__
	- The length of measurement also has to be estimated, this defines the _frequency resolution using FFT_
- Excitation is applied to the process, the output is measured
- The **fourier transforms of the input and output** *are needed*: $$\begin{gather}
Y(\omega) = \int_{-\infty}^{\infty} y(t) e^{-j\omega t} dt \\
U(\omega) = \int_{-\infty}^{\infty} u(t) e^{-j\omega t} dt
\end{gather}$$
- The _result of the identification_, or the _frequency response_ is obtained by dividing the Fourier transforms: $$G(j\omega) = \frac{Y(\omega)}{U(\omega)}$$
- Verification
- Validation
- If necessary, certains steps are repeated

### ETFE - convergence analysis - effect of noise
- The output signal $y(t)$ is _corrupted by noise_ $n(t)$ $$y(t) = y_0(t) + n(t)$$
- The resulting frequency response is: $$G(j\omega) = \frac{F\{y_0(t) + n(t)\}}{F\{u(t)\}} = G_0(j\omega) + \Delta G_n(j\omega)$$
- So the _frequency response error is:_ $$\begin{gather}
\Delta G_n(j\omega) = \frac{F\{n(t)\}}{F\{u(t)\}} \\
\Delta G_n(j\omega) = \frac{N(\omega)}{U(\omega)}
\end{gather}
$$
#### Bias
- If the noise is _not correlated_ with the input and undisturbed output, and it's _mean value is $0$_. The mathematical expectation of frequency reponse error $\Delta G_n(j\omega)$ becomes: $$
E\{\Delta G_n(j\omega)\} = E\left\{\frac{F\{n(t)\}}{F\{u(t)\}}\right\} = \frac{E\{F\{n(t)\}\}}{E\{F\{u(t)\}\}}
= \frac{F\{E\{n(t)\}\}}{F\{E\{u(t)\}\}} = \frac{0}{U(\omega)}
$$
- The estimated _frequency response is_ __unbiased__ for all excited frequencies _where:_ $U(\omega) \neq 0$
- The estimate of the frequency response is also cinsistent because it's _bias free_
#### Consistency in the mean square
- Variance of the frequency response error $\Delta G_n(j\omega)$: $$\begin{gather}
E\{| \Delta G_n(j\omega) |^2\} = \frac{E\{F\{n(t)\}F\{n(t)\}\}}{E\{F\{u(t)\}F\{u(t)\}\}} = \frac{E\left\{\int_{-\infty}^{\infty} n(t)e^{-j\omega t} dt \int_{-\infty}^{\infty} n(\tau)e^{j\omega \tau} d\tau \right\}}{E\left\{\int_{-\infty}^{\infty} u(t)e^{-j\omega t} dt \int_{-\infty}^{\infty} u(\tau)e^{j\omega \tau} d\tau \right\}} \\
= \frac{\int_{-\infty}^{\infty} E\{n(t)n(\tau)\} e^{-j\omega(t-\tau)} dt d\tau}{\int_{-\infty}^{\infty} E\{u(t)u(\tau)\} e^{-j\omega(t-\tau)} dt d\tau} \\
= \frac{\int_{-\infty}^{\infty} \varphi_{nn}(t-\tau) e^{-j\omega(t-\tau)} dt d\tau}{\int_{-\infty}^{\infty} \varphi_{uu}(t-\tau) e^{-j\omega(t-\tau)} dt d\tau} \\
= \frac{\varphi_{nn}(\omega)}{\varphi_{uu}(\omega)} \approx \frac{\varphi_{nn}(\omega) T A}{|U(\omega)|^2}
\end{gather}
$$
- The overbar in the above equation denotes complex conjugate of a complex number
- $T_A$ is the _observation time_ that has to be long enough to include all the transients
$$E\{| \Delta G_n(j\omega) |^2\} \approx \frac{\Phi_{nn}(\omega) T A}{| U(\omega) |^2}
$$
- The variance of the frequency response at a certain frequency $\omega$:
	- _Increases_ with increased power spectral density #TODO PSD definicija
	- _Increases_ with a _longer observation interval_ $T_A$
	- _Decreases_ with higher power spectral density of the input at $\omega$
- It increases with a longer observation time, because it _does not bring any new information about the system dynamics_ (transients). So the _useful signal energy does not increase_ and longer observation just __increases the energy of the noise__
- The variance of _unexcited frequencies_ $(|U(j\omega)| \rightarrow 0)$ is _theoreticaly unbounded_

__Noise is white:__
- The variance of the frequency response error: $$E\{| \Delta G_v(j\omega) |^2\} = \frac{\Phi_0 T A}{| U(\omega) |^2}
$$
- The *estimated frequency response is un-biased*
- The estimated frequency response is *low in amplitude at high frequencies* and the *noise component becomes dominant*
- Amplitude response is obtained by taking absolute value of frequency response 
- Mean-value of the absolute value of noise is not zero, because 
  - It can be shown that the mean-value of the absolute value of noise $v(t)$ with noise distribution $p(\nu)$ is $$
    \int_{-\infty}^{\infty} |\nu| p(\nu) d\nu
    $$
  - For Gaussian noise with standard deviation $\sigma_\nu$:
    - The mean value of $|v(t)|$ is $$
    \sigma_\nu \sqrt{\frac{2}{\pi}} = 0.7979 \sigma_\nu
    $$ 

### ETFE covergence analysis - unknown operating point
- Signals $u(t), y(t)$ are only the _deviations from the operating point_ $$\begin{gather}u(t) = U(t) - U_{00} \\ y(t) = Y(t) - Y_{00} \end{gather}$$
- The stationary values of the output signals are estimated _before the start r after the end_ of the identification signal. 
- The estimate of $Y_{00}{}$ can be obtained by _averaging the absolute output signal_ before the start or after the end of the transient
	- Before: $$\hat{Y}_{00} = \frac{1}{T_B}\int_{-T_B}^{0}Y(t)dt$$ $T_B$ is the length of the _averaging interval_
- Mathematical expectation of the error of the stationary state estimate $\Delta Y_{00} = \hat{Y}_{00} - Y_{00}$ is: $$  E\{\Delta Y_{00}\} = E\left\{ \frac{1}{T_B} \int_{-T_B}^{0} [Y_0 + y_0(t) + n(t)] dt - Y_0 \right\} = \frac{1}{T_B} \int_{-T_B}^{0} E\{n(t)\} dt = 0$$($y_0(t)$ is $0$ in the operating point)
  - The estimate is bias-free if the mean value of the noise is 0

- The variance of the stationary-state-estimate error:$$  E\{ \Delta Y_{00}^2 \} = E\left\{ \left( \frac{1}{T_B} \int_{-T_B}^{0} n(t) dt \right)^2 \right\} = \frac{1}{T_B^2} \int_{-T_B}^{0} \int_{-T_B}^{0} E\{n(t) n(\tau)\} dtd\tau$$
  - For white noise ($n(t) = v(t)$), the above expression reduces to:$$E\{\Delta Y_{00}^2\} = \frac{\Phi_0}{T_B}$$

- The error due to unknown operating point:
	- Step with amplitude $\Delta Y_{00} \rightarrow$ its Fourier transform is:$$\frac{\Delta Y_{00}}{j\omega}$$
	  - The *error of the frequency response is* $\Delta G_Y(j\omega) = \frac{\Delta Y_{00}}{j\omega U(\omega)}$

## Analysis of frequency response
#TODO 181-183

### Analysis of frequency response with a sampler
- The putput signal is sampled in _two sampling instants:_
	- The first: $t_1$ is aligned with the _start of a new period of the input_ $$t_1 = nt_p = n\frac{2\pi}{\omega_0} \quad n=1,2,3,\cdots$$
	- The second: $t_2$ is _taken a quarter of the period before:_ $$t_2 = nt_p - \frac{t_p}{4} = (n-\frac{1}{4})\frac{2\pi}{\omega_0} \quad n=1,2,3,\cdots$$
	- $t_p = \frac{2\pi}{\omega_0}$ is _a period of harmonic oscilations_ with angular frequency $\omega_0$
- The following mathematical relations are used: $$\begin{gather}\cos(\omega_0 t_1 + \varphi) = \cos(2\pi n + \varphi) = \cos(\varphi) \\ \cos(\omega_0 t_2 + \varphi) = \cos(2\pi n - \frac{\pi}{2} + \varphi) = \sin(\varphi)\end{gather}$$
- Output sampls at $t_1$ and $t_2$ are therefore: $$\begin{gather}y(t_1) = U_0 |G(j\omega_0)| \cos \varphi(\omega_0) \\ y(t_2) = U_0 |G(j\omega_0)| \sin \varphi(\omega_0)\end{gather}$$
- Complex frequency response *can be decomposed into its real and imaginary parts* that are *related to its amplitude and phase*:
  
  $$\mathbb{R}[G(j\omega_0)] = |G(j\omega_0)| \cos \varphi(\omega_0)$$  
  $$\mathbb{I}[G(j\omega_0)] = |G(j\omega_0)| \sin \varphi(\omega_0)$$

- Real and imaginary part *can be obtained from output samples*:
$$y(t_1) = U_0 \mathbb{R}[G(j\omega_0)] \rightarrow \mathbb{R}[G(j\omega_0)]$$
  $$y(t_2) = U_0 \mathbb{I}[G(j\omega_0)] \rightarrow \mathbb{I}[G(j\omega_0)]$$

- If *noise is zero-mean*, frequency response estimate is *bias-free*.
- The variances of real and imaginary parts are directly related to the variance of the output measurements (only divided with $U_0^2$):

  - Only useful for processes with low level of noise.
  - Only two measurements at each frequency → consistency in the mean square cannot be defined.

- **If signals are (very) noisy, correlation methods come useful:**
  
  - Orthogonal correlation is an approach that can be classified into the group of methods for analysis of frequency response.

- **Orthogonal correlation takes the red path in the scheme:**

  - Again sine/cosine input signals are used.
  
  - Again one experiment is needed for estimation of one point of frequency response → Fourier analysis is not needed.
![[Pasted image 20250318152225.png]]

## Orthogonal correlation
- An *arbitrary phase* of the input signal can be chosen – here a cosine is *assumed to make the following equations simpler*:

  $$u(t) = U_0 \cos(\omega_0 t)$$

- The *stationary part* of the output is:

  $$y(t) = U_0 |G(j\omega_0)| \cos[\omega_0 t + \varphi(\omega_0)] \quad \text{for} \ t > t_{\text{transient}}$$

- Auto-correlation of $u$ and *cross-correlation* between $u$ and $y$ are:$$\varphi_{uu}(\tau) = \mathbb{E}\{ u(t)u(t + \tau) \} = \lim_{T_i \to \infty} \frac{1}{T_i} \int_0^{T_i} u(t) u(t + \tau) \, dt$$$$\varphi_{uy}(\tau) = \mathbb{E}\{ u(t) y(t + \tau) \} = \lim_{T_i \to \infty} \frac{1}{T_i} \int_0^{T_i} u(t) y(t + \tau) \, dt$$
- 