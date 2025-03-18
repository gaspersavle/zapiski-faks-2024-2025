# LS parameter estimation of discrete-time dynamical systems
- We assume that the process can be _described with a transfer function_ $$G_p(z) = \frac{B(z^{-1})}{A(z^{-1})} z^{-d} = \frac{b_1 z^{-1} + \dots + b_n z^{-n}}{1 + a_1 z^{-1} + \dots + a_n z^{-n}} z^{-d}$$where:
	- $d$: time delay, should be _know  a priori_
	- $n$: system order _a priori_
	- $a_i$ and $b_i$ system _parameters_, that we want to estimate by the LS method
- The output is corrupted by noise $n$, by _filtering noise_ $v$ through: $$G_n(z) = \frac{1}{A(z^{-1})}$$
- The _z transform_ of the disturbet process output is: $$y(z) = \frac{B(z^{-1})}{A(z^{-1})} z^{-d} u(z) + \frac{1}{A(z^{-1})} v(z)$$
- The time-domain version o the equation is obtained after the _inverse z transformation_ has been performed $$y(k) + a_1 y(k-1) + a_2 y(k-2) + \dots + a_n y(k-n) = b_1 u(k-d-1) + \dots + b_n u(k-d-n) + v(k)$$where the _measurements:_ $y(\cdots)$ are known, _noise:_ $v(k)$ is unknown, and _parameters:_ $a_i, b_i$ are estimated
- The equation in vector form: $$y(k) = \mathbf{\Psi^T}(k)\mathbf{\theta}+v(k)$$where $\mathbf{\Psi^T}(k)$ contains the _measurements_ $$[-y(k-1),\cdots,-y(k-n), u(k-d-1),\cdots,u(k-d-n)]$$ and $\mathbf{\theta^T}$ contains the _parameter vector_ $[a_1,\cdots, a_n,b_1,\cdots,b_n]$  
- #TODO 111-112
- The error $e(k)$ is a _generalised one_, obtained by _filtering_ the process input and output through the model $\hat{A} \space \text{and} \space \hat{B}(z)^{-d}$
- The schematic representation of the error model is:
![[Pasted image 20250310085032.png]]

- The system of equations for determining of the *parameter estimates* $\mathbf{\hat{\theta}}$ is obtained by _rewriting_: $$e(k) = y(k)-\mathbf{\Psi}^T(k) \hat{\mathbf{\theta}}$$ in _different observation times_ ($N$ equations are obtained)
	- The number of equations $N$ has to be at least as large as the number of estimated parameters ($2n$), but in practice its much larger
	- The generalised error in the current time sample $k$ and $N-1$ past time samples: $$\begin{aligned} e(k - N + 1) &= y(k - N + 1) - \psi^T(k - N + 1) \hat{\theta} \\ e(k - N + 2) &= y(k - N + 2) - \psi^T(k - N + 2) \hat{\theta} \\ &\vdots \\ e(k - 1) &= y(k - 1) - \psi^T(k - 1) \hat{\theta} \\ e(k) &= y(k) - \psi^T(k) \hat{\theta} \end{aligned}$$which can be obtained using matrix-vector representation for a _more compact system description_ 
		- _Vectors_ $\mathbf{y, e, v, \Psi}$  $$\mathbf{y} = \begin{bmatrix} y(k - N + 1) \\ y(k - N + 2) \\ \vdots \\ y(k - 1) \\ y(k) \end{bmatrix}, \quad \mathbf{e} = \begin{bmatrix} e(k - N + 1) \\ e(k - N + 2) \\ \vdots \\ e(k - 1) \\ e(k) \end{bmatrix}, \quad \mathbf{v} = \begin{bmatrix} v(k - N + 1) \\ v(k - N + 2) \\ \vdots \\ v(k - 1) \\ v(k) \end{bmatrix} $$ $$ \psi^T(k) = \big[ -y(k - 1) \quad \dots \quad -y(k - n) \quad u(k - 1 - d) \quad \dots \quad u(k - n - d) \big] $$
		- _Matrix_$\mathbf{\Psi}$ $$ \Psi = \begin{bmatrix} \psi^T(k - N + 1) \\ \psi^T(k - N + 2) \\ \vdots \\ \psi^T(k - 1) \\ \psi^T(k) \end{bmatrix} = \begin{bmatrix} - y(k - N) & \dots & -y(k - N - n + 1) & u(k - N - d) & \dots & u(k - N - n - d + 1) \\ \vdots & \vdots & \vdots & \vdots & \vdots & \vdots \\ - y(k - 1) & \dots & -y(k - n) & u(k - 1 - d) & \dots & u(k - n - d) \end{bmatrix}$$
	- The _generalised error vector given in the matrix-vector form:_ $$\mathbf{y-\Psi\hat{\Theta}=e}$$
	- Similarly, the _process equation_ $y(k) = \mathbf{\Psi^T}(k) \theta = v(k)$ can be wrewritten in the same $N$ time instants $$\mathbf{y-\Psi\Theta = v}$$
	- The equations above ar ethe same as in the case of the [[identifikacija_p3#Vector problem|vector problem]], where the solution was: $$\mathbf{\hat{\Theta}=[\Psi^T \Psi]^{-1}\Psi^T y}$$
	- The matrix $\mathbf{\Psi^T \Psi}$ is always _symetrical_ and square, of _dimension:_ $2n \times 2n$
	- The inverse of the matrix _has to exist_, it is full rank, non singular and has a non-zero determinant
		- This is achieved by appropriate excitation, the input signal has to be _"rich enough"_ in terms of the _frequency spectrum_

## Bias, consistency and convergence of estimates
- When we introduce the $\mathbf{y = \Psi \Theta + v}$ in place of $y$ into the parameter equation: $$\hat{\theta} = [\Psi^T \Psi]^{-1} \Psi^T (\Psi \theta + \mathbf{v}) = \theta + [\Psi^T \Psi]^{-1} \Psi^T \mathbf{v}$$
- The mathematical expectation of the parameter estimate: $$$$
- If $E\{\Psi^T v\} = 0$, the __estimate is bias-free__
	- In $\mathbf{\Psi^T v}$, only products of the type $v(i)y(i-c)$ and $v(i)u(i-c)$ can be found, where $i$ is an arbitrary integer, $c$ is an arbitrary _positive integer_
	- The estimate $\hat{\theta}$ is therefore _bias free if the noise_ $v(k)$ is uncorrelated with the past input and output process values and either noise or input and putput are zero mean
		- If the current noise is not correlated with past inputs, the estimate is not a problem
		- If the current noise is not correlated with past putputs, the estimation could be a problem, unless the __noise is white__
- The _parameter estimate_ $\hat{\theta}$ is bias free if:
	1. The process _output noise_ $n(k)$ is obtained by filtering noise $v(k)$ through a _noise filter_ $\frac{1}{A(z^{-1})}$ and 
	2. Either noise $v(k)$ or process input $u(k)$ is _zero-mean_

- When the above conditions are met, the following holds: $$\mathbf{\hat{\Theta} = \Theta \Rightarrow e = v}$$ which means $e(k) = v(k)$ for all $k$ from the interval
- #TODO 119

## Recursive leas squares (RLS) method
- The least squares method provides parameter estimates after a batch of _previously collected data_. It belongs to a group of _offline methiods_ with a _non-recursive_ estimation algorithm and noe-step processing
- If parameters need to be estimated online, the estimates are updated as new measurements from the process arive
- Each new parid of I/O measurements, adds some information that is mathematically reflected in an additional equation or alternatively in extending the vector $\mathbf{y}$ with $y(k+1)$ and _extending the matrix_ $\mathbf{\Psi}$ with a row $\mathbf{\Psi^T}(k+1)$
- If a _non-recursive method was applied_, the product $\mathbf{\Psi \Psi^T}$ would have to be inverted and multiplied by $\mathbf{\Psi^T y}$ in each sample time, which is _very time-consuming_
- The equations will therefore be transformed into a recursive form
- The recursive method is __mathematicaly equivalent__ to the non-recursive method, but the updated estimat is _obtained in each sampling time_, based on the previous estimate, withot having to invert the _covariance  matrix_
- The matrices and vectors change over time and will be denoted as discrete-time signals (with argument $k$)
- Non-recursive parameter estimation is: $$\hat{\theta}(k) = [\mathbf{\Psi}^T(k)\mathbf{\Psi}(k)]^{-1}\mathbf{\Psi}^T(k)\mathbf{y}(k)$$
- A new matrix is introduced: $$\mathbf{P}(k) = [\Psi^T(k) \Psi(k)]^{-1}$$this matrix is _proportional to the covariance matrix_, which is the above formla, multiplied by the _variance of the error_ $\sigma_e^2$ 
- The matrices and vectors gain new elements every sampling interval: $$\mathbf{y}(k+1) = \begin{bmatrix} y(k) \\ y(k+1) \end{bmatrix} \quad \Psi(k+1) = \begin{bmatrix} \Psi(k) \\ \psi^T(k+1) \end{bmatrix}$$ $$\psi^T(k+1) = \big[ -y(k) \quad \dots \quad -y(k - n + 1) \quad u(k - d) \quad \dots \quad u(k - n - d + 1) \big]$$
- #TODO 122$$\underbrace{\hat{\theta}(k+1)}_\text{updated estimate} = \underbrace{\hat{\theta}(k)}_\text{last estimate} + \underbrace{\mathbf{P}(k+1)\Psi(k+1)}_\text{correction gain}\underbrace{[y(k+1)-\mathbf{\Psi^T}(k+1)\mathbf{\hat{\theta}}(k)]}_\text{new measurement - predicted measurement}$$

## Weighted least squares method (WLS)
#TODO up to 127

## Parameter estimation for time varying processes
- If the process is time-varying, _continuous changes of estimation parameters_ are to be expected. So the elements of the _covariance matrix_ $\mathbf{P(k)}$ should be prevented from going to $0$.
- We can achieve that with 2 principal approaches:
	- __Forgetting:__ the elements of $\mathbf{P}(k)$ are slightly _increased in each sampling time_. Therefore it's not possible for them to converge to $0$
	- __Covariance resetting:__ The covariance matrix is set to _some constant matrix_ from time to time. The moments can be selected:
		- _Periodicaly_
		- _When it's trace drops below a threshold:_ The trace is the sum of the diagonal elementrs of the matrix
- Both of these methods have pros and cons:
	- _Reseting_ is useful when the chages are in the form of a periodic jump
	- _Forgetting_ is useful when changes are _drift-like_

## Unknown steady-state values
The input-output measurements $u(k)$ and $y(k)$ that constitute the measurement vector $\mathbf{\Psi}$ are not original readings from sensors, they are _deviations from steady-state values_ of the input and output (deviations from the operating point) $$\begin{gather}u(k) = U(k) - U_{00} \\ y(k) = Y(k) - Y_{00}\end{gather}$$
- A simple approach for determination of steady-state values is to _require zero-mean long-time average_ of $u(k)$ and $y(k)$ $$\sum_{k=0}^{N} u(k) = 0 \quad \text{and} \quad \sum_{k=0}^{N} y(k) = 0$$
- or $$U_{00} = \frac{1}{N+1} \sum_{k=0}^{N} U(k) \quad \text{and} \quad Y_{00} = \frac{1}{N+1} \sum_{k=0}^{N} Y(k)$$

## Estimation of the operating point
- If we introduce$$\begin{gather}u(k) = U(k) - U_{00} \\ y(k) = Y(k) - Y_{00}\end{gather}$$ into the process, the difference equation yelds: $$\begin{gather}Y(k) = -a_1 Y(k-1) - \dots - a_n Y(k-n) + b_1 U(k-d-1) + \dots + b_n U(k-d-n) + \\
\quad + Y_{00} + a_1 Y_{00} + \dots + a_n Y_{00} - b_1 U_{00} - \dots - b_n U_{00} + v(k)\end{gather}$$
- All terms can be combined due to the steady state conditions: $$K = Y_{00} + a_1 Y_{00} + \dots + a_n Y_{00} - b_1 U_{00} - \dots - b_n U_{00}$$
- The $K$ parameter is added to the vector of unknown parameters: $$\mathbf{\Theta^T} = [a_1, \cdots, a_n, b_1, \cdots, b_n, \mathbf{K}]$$ $$\Psi^T(k) = \begin{bmatrix} 
- Y(k-1), \dots, - Y(k-n), U(k-d-1), \dots, U(k-d-n), 1 
\end{bmatrix}$$
- Regressors $\Psi$ now include absolute measurements (not deviations) and element $1$ is not included in the end
- The process equation takes the following form: $$Y(k) = \mathbf{\Psi^T}(k)\theta + v(k)$$
- The equation has a standard form and the problem solution is also a standard one
### Cancelling the steady-state values by differencing
- #TODO 
## Unknown steady state values
- Pros and cons of on-line approaches
	- Extra estimated parameter $\hat{K}$
		- + less sensitive to noise
		- + estimate $\hat{K}$ *gives mathematical relation* between $U_{00}$ and $Y_{00}$
		- - extra estimated parameter leads to slower convergence
	- Differencing:
		- + Number of estimated parameters is the same as in LS approaches
		- - Differencing *amplifies high frequency noise* and thus *affects convergence*

## Numerical problems
- These problems arise if the _parameter estimation is applied on an ill-conditioned system of equations_
- Identification requires that the order of the process and rime delay are known in advance
	- If the exact orde ris not known, _a higher one can be selected_, that leads to exta regressors that dont affect the output
	- If the estimated delay $d$ is _smaller than the actual delay_ $d_0$, the parameters $b_0, \cdots, b_{d_0-d}$ become _redundant_
- The consequence of redundant parameters is an _ill-conditioned system_
	- Pole-zero pairs that lie close together are estimated
	- They have negligible contribution to the input-output process behavior
	- If they move drasticaly, the putput is not significant
	- If they move to the unstable region, this seriously affects the model
- #TODO 136,137
- Norm of a matrix: $$||\mathbf{A}|| = \sup_{x\neq0}\frac{||\mathbf{Ax}||}{||\mathbf{x}||}$$where $\sup$ is either the maximum or minimum of the linear transformation, even outside the scope of the function
#TODO 

## Method of extended least squares (ELS)
#TODO 

## Stability of the ELS method
#TODO 

# Tags:
#identifikacija