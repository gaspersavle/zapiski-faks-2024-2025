# Linear optimisation
Optimisation is linear if _the gradient of the cost function is linear_ in the parameters, which means that *each component of the gradient is a linear function*

Linear optimisation has the following properties
- Existence of an optimal solution, which is a global optimum
- Each step acn be calculated analytically
- There are a lot of numerically stable and fast algrithms
- Recursie forms are possible
- Can be implemented online
- The surface of the criterion function is a _hyper-parabola_ in the form: $$\frac{1}{2}\mathbf{\theta}^T \mathbf{H} \mathbf{\theta} + \mathbf{h}^T \mathbf{\theta} + h_0$$ with n-dimensional parameter vectors $\theta$, an $n\cdot n$ dimensional matrix $\mathbf{H}$, an $n$-dimensional vector $\mathbf{h}$ and the scalar $h_0$

![[Pasted image 20250224111726.png]]

Cost and fitness functions serve virtually the same purpuse, but vary on the use case
- We want to _minimise the cost function_ to optimise the problem, like in the [[intelligent_decision_support_systems_p0#Intro to optimisation|previous lecture]] 
- We wanto to _maximise the fitness function_ to optimise the problem

We assume the *following structure* of the model input $\tilde{y}$, aka its linear dependence on $n$ parameters $\theta_i$ $$\tilde{y} = \theta_1x_1 + \theta_2x_2 + \cdots + \theta_n x_n = \sum_{i=1}^n\theta_ix_i$$
The variables $x_i$ are called _regressors_ or independent variables, the parameters $\theta_i$ are called _regressor coefficients_, $y$ is called the _dependent variable_ and the whole problem is called __linear regression__. 


## Least squares method
$\{\mathbf{u}(i),  y(i)\}$ represent an _input-output pair_, there are $N$ of them
$$
\begin{gather}
\mathbf{e} = 
\begin{bmatrix}
e(1) \\
e(2) \\
\vdots \\
e(N)
\end{bmatrix}, \quad \mathbf{y} = 
\begin{bmatrix}
y(1) \\
y(2) \\
\vdots \\
y(N)
\end{bmatrix}, \quad \mathbf{\hat{y}} = 
\begin{bmatrix}
\hat{y}(1) \\
\hat{y}(2) \\
\vdots \\
\hat{y}(N)
\end{bmatrix}, \quad \mathbf{n} = 
\begin{bmatrix}
n(1) \\
n(2) \\
\vdots \\
n(N)
\end{bmatrix}
 \\ \\
\mathbf{X} =
\begin{bmatrix}
x_1(1) & x_2(1) & \cdots & x_n(1) \\
x_1(2) & x_2(2) & \cdots & x_n(2) \\
\vdots & \vdots & \ddots & \vdots \\
x_1(N) & x_2(N) & \cdots & x_n(N)
\end{bmatrix}, \quad \mathbf{\theta} = 
\begin{bmatrix}
\theta_1 \\
\theta_2 \\
\vdots \\
\theta_n
\end{bmatrix}\end{gather}$$

Collums in the regression matrix $\mathbf{X}$ are _single regression vectors_, in the form: $$\mathbf{x_i} = \begin{bmatrix}x_i(1) \\x_i(2)\\ \vdots \\ x_i(N)\end{bmatrix}$$ for $i = 1, \cdots, n$. The *regression matrix* $\mathbf{X}$ can also be written as: $$\mathbf{X} = \{\mathbf{x_1, x_2, \cdots, x_n}\}$$
The _model structure_ is a $m$- order polynomial, with which we approximate the data. The output $\hat{y}$ of the model is: $$\hat{y} = c_0 + c_1 u + c_2 u^2 + \cdots + c_m u^m = \sum_{i=0}^m c_iu^i$$
We get the _model error_ $e(k) = y(k) - \hat{y}(k)$, which is equal to: $$e(k) = y(k) - c_0-c_1u-c_2u^2-\cdots-c_mu^m$$
The __polynomial model schematic is:__
![[Pasted image 20250224185005.png]]

### Example: Least square method in polynomial form
The _regression matrix_ $\mathbf{X}$ and _vector of model parameters_ $\mathbf{\theta}$ are:$$
\mathbf{X} =
\begin{bmatrix}
1 & u(1) & u^2(1) & \dots & u^m(1) \\
1 & u(2) & u^2(2) & \dots & u^m(2) \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
1 & u(N) & u^2(N) & \dots & u^m(N)
\end{bmatrix}
\quad
\mathbf{\theta} =
\begin{bmatrix}
c_0 \\
c_1 \\
c_2 \\
\vdots \\
c_m
\end{bmatrix}
$$

Consider an example of _model identification_ in the form of a time-discrete linear dynamic process. A model for a __one-step ahead__ prediction of the process output, can in the case of  $m$-order dynamics, writen as: $$
\hat{y}(k) = b_1 u(k - 1) + \dots + b_m u(k - m) - a_1 y(k - 1) - \dots - a_m y(k - m)
$$
 We can see that _some regressors are_ __dependent__ on the output of the process. This implies a _violation of the assumption that the regressors depend only on the inputs_
 
 
We get the error $e(k) = y(k) - \tilde{y}(k)$, which is equal to:
$$
e(k) = y(k) + a_1 y(k - 1) + \dots + a_m y(k - m) - b_1 u(k - 1) - \dots - b_m u(k - m)
$$


### Explanation of the least squares method
The _regression matrix_ $\mathbf{X}$ at $N$ measurement samples and _parameter vector_ $\mathbf{\theta}$ are now: $$
\begin{gathered}
\mathbf{X} =
\begin{bmatrix}
u(m) & \dots & u(1) & -y(m) & \dots & -y(1) \\
u(m+1) & \dots & u(2) & -y(m+1) & \dots & -y(2) \\
\vdots & \vdots & \vdots & \vdots & \vdots & \vdots \\
u(N-1) & \dots & u(N-m) & -y(N-1) & \dots & -y(N-m)
\end{bmatrix} \\ \\
\theta =
\begin{bmatrix}
b_1 & \dots & b_m & a_1 & \dots & a_m
\end{bmatrix}^{T}
\end{gathered}
$$the matrix has dimensions $(N-m)\times 2m$

The output of the model can be written in _vector form_ $\tilde{y} = X\theta$ If we enter this into the least squares method, we get the _criterion function_ $I(\theta)$ $$
I(\theta) = \frac{1}{2} e^T e \rightarrow \min_{\theta}
\quad \text{where} \quad
e = y - \hat{y} = y - \mathbf{X} \theta
$$

And the _criterion function is equal to:_ 
$$
I(\theta) = \frac{1}{2} \left( y^T y - y^T \mathbf{X} \theta - \theta^T \mathbf{X}^T y + \theta^T \mathbf{X}^T \mathbf{X} \theta \right)
$$
This function is a __parabolic function if presented in the parameter space of the vector $\mathbf{\theta}$__$$\mathbf{I(\theta) = \frac{1}{2}\theta^T H \theta + h^T \theta + h_0}$$
With the _quadratic term_:: $$\mathbf{H = X^T X}$$ and the _linear term_ $$\mathbf{h = -X^T y}$$ because it's considered that $\mathbf{X^T y = y^T X}$ and *the constant*: $$h_0 = \frac{1}{2}\mathbf{y^T y}$$
The square term $\mathbf{H}$ is called the __Hessian matrix__ aka the _second derivative of the criteria function_. In the __optimum__, the derivative of $I(\theta)$ with respect to the _parameter vector_ $\theta$ is zero. From this it follows that __for an optimum, the error is orthigonal to all regressors $\mathbf{x_i}$__
$$
\frac{\partial I(\theta)}{\partial \theta} = H\theta + h
$$

$$
\frac{\partial I(\theta)}{\partial \theta} = -\mathbf{X}^T \left( y - \mathbf{X} \theta \right) = -\mathbf{X}^T e = 0
$$
We get a solution using _the least squares method:_

$$
\hat{\theta} = (\mathbf{X}^T \mathbf{X})^{-1} \mathbf{X}^T y.
$$

If we derive the _criterion function_ to get it's _gradient_ $$\frac{\partial I(\theta)}{\partial \theta} = \mathbf{g} = \frac{1}{2}\left(-\mathbf{x^T y-x^T y + 2(x^T x \theta)}\right) = \mathbf{0}$$ $$-\mathbf{x^T (y-x\theta) = -x^T\cdot e = 0}$$
$$\tilde{\mathbf{\theta}} = (\mathbf{x^T x})^{-1} \mathbf{x^T y}$$
![[Pasted image 20250224120411.png]]
In the optimum, the vector $\mathbf{x \theta}$ is closest to the vector $\mathbf{y}$. The *orthogonal vector* $\mathbf{e}$ is the smallest and orthogonal to all regressors as shown in the image above

### Least square method in the correlation perspective
The least squares method can also b represented from the _correlation perspective_, if we calculate the **correlation matrix** $\mathbf{x^T x}$ $$
\mathbf{X}^T \mathbf{X} = N
\begin{bmatrix}
\frac{1}{N} \sum_{i=1}^{N} x_1^2(i) & \frac{1}{N} \sum_{i=1}^{N} x_1(i)x_2(i) & \cdots & \frac{1}{N} \sum_{i=1}^{N} x_1(i)x_n(i) \\
\frac{1}{N} \sum_{i=1}^{N} x_2(i)x_1(i) & \frac{1}{N} \sum_{i=1}^{N} x_2^2(i) & \cdots & \frac{1}{N} \sum_{i=1}^{N} x_2(i)x_n(i) \\
\vdots & \vdots & \ddots & \vdots \\
\frac{1}{N} \sum_{i=1}^{N} x_n(i)x_1(i) & \frac{1}{N} \sum_{i=1}^{N} x_n(i)x_2(i) & \cdots & \frac{1}{N} \sum_{i=1}^{N} x_n^2(i)
\end{bmatrix}
$$
and calculate $\mathbf{x^T y}$, $$\mathbf{X}^T y = N \begin{bmatrix} \frac{1}{N} \sum_{i=1}^{N} x_1(i) y(i) \\ \frac{1}{N} \sum_{i=1}^{N} x_2(i) y(i) \\ \vdots \\ \frac{1}{N} \sum_{i=1}^{N} x_n(i) y(i) \end{bmatrix}$$Then the estimation od model parameters can be written as $$\tilde{\theta} = corr\{x,x\}^{-1}\cdot corr\{x,y\}$$where $corr\{x,x\}$ is an __autocorrelation function__ corresponding to _auto and cross correlation of all combinations of regressors_ and $corr\{x,y\}$ represents the __cross-correlation__ vector of all correlations of regressors and the putput $y$
### Conditionality of the Regression matrix
When solving an optimization problem, the consensus that we _need at least as many measurements as we have parameters_, to determine the unknown parameters, or in the context of the regression matrix. __The matrix must have at least as many rows as there are columns__, the matrix columns must also be __linearly independent__

To calculate the inverse of $\mathbf{x^T x}$, which actually _represents the Hessian matrix_ of the criterion function, the _degree of conditionality is decisive_ $$\mathbf{H} = \frac{\partial^2 I(\theta)}{\partial \theta^2} = \mathbf{x^T x}$$
We can only get a good estimate of the model parameters, if the _conditionality of the Hessian matrix is good_. The conditionality of the matrix is defined as the __quotient between the maximum and minimum eigenvalues of the matrix $\mathbf{H}$__, since its a positive and semi-definite matrix, all eigenvalues are _real and non-negative_, if $\mathbf{H}$ is non singular, the eigenvalues are *all strictly positive* $$X = \frac{\lambda_{max}}{\lambda_{min}}$$
### Influence of conditionality to the parameter variance - sensitivity of parameters
#TODO 

## Expected value and variance
In stochastic processes, the most important quantities that determine the properties of random variables are their _expected value and variance_

- Expected value is used when we wanto to calculate the expected calue if the random variable. All realisations must be weighted with their probability and integrated over all values.
- The model parameters are estimated with varying accuracy, The accuracy of the parameters is _expressed by the covariance matrix of estimated parameters_ $$
\text{cov} \{ \hat{\boldsymbol{\theta}} \} = \mathbb{E} \left\{ \left( \hat{\boldsymbol{\theta}} - \mathbb{E} \{ \hat{\boldsymbol{\theta}} \} \right) \left( \hat{\boldsymbol{\theta}} - \mathbb{E} \{ \hat{\boldsymbol{\theta}} \} \right)^{\text{T}} \right\}
$$where $E(\theta)$ is deterministic

Because the _hessian matrix is symmetric_. If $n_y$ is the white noise with the variance $\sigma^2$. we get the final covariance matrix of setimated parameters $$
\text{cov} \{ \hat{\boldsymbol{\theta}} \} = \sigma^2 \left( \mathbf{X}^T \mathbf{X} \right)^{-1} = \sigma^2 \mathbf{H}^{-1}
$$
$$\sigma^{2} = \frac{e^{T}e}{N - n}$$

### Confidence interval
The _covariance matrix_ describes the variance of the model output for each output value
The _tolerance band_ is defined as the positive and negative offset for the standard deviation from an estimated output of the model $$\tilde{\mathbf{y}}\pm \sqrt{diag(cov\{\tilde{\mathbf{y}}\})}$$
If we want to determine the so called __confidence interval__ of the model output signal, we must ensure that the output with a certain probability lies within the _prescribed interval_ with the known distribution of noise. Assuming _gaussian noise_, the inteval $\sigma$ determines 68,2% probability, and an interval of $2\sigma$ means 95,4% probability _that the output lies within the interval_
#TODO example

### Orthogonal regressors
If the Hessian matrix has non-zero non-diagonal elements, the regressors are _not linearly independent_

### Regularisation
Regression is the method where we also _take into account the value of the model parameters_. We also indirectly _influence thevariance of the parameters_ using this method $$ I(\theta, \alpha) = \frac{1}{2} \left( e^T e + \alpha |\theta|^2 \right) \rightarrow \min_{\theta} $$
#### Example: Regularization and conditionality of the matrix
The _conditionality of the Hessian matrix:_ $$\mathbf{H}\begin{bmatrix}100 && 0 \\ 0 && 0.01\end{bmatrix}$$is equal to $X=10000$, for $\alpha=1$ the _conditionality of the modified Hessian matrix is:_ $$\mathbf{H}\begin{bmatrix}100 && 0 \\ 0 && 0.01\end{bmatrix}+ 1\begin{bmatrix}1 && 0 \\ 0 && 1\end{bmatrix} = \begin{bmatrix}101 && 0 \\ 0 && 1.01 \end{bmatrix}$$only $X_{reg} \approx 100$ 
#TODO 

### Weighted least squares (WLS)
The least squares method can be _expanded into the weighted least square method_. In this case, the criterion function can be written as: $$\mathbf{I(\theta)} = \frac{1}{2} \mathbf{e^T Q e}$$where $Q$ is the _weight matrix_. Most often it's diagonal

### Recursive least squares (RLS)
#TODO 

# Local non-linear optimmisation
If the gradient of the cost function is nonlinear in parameters, we need to take a non-linear approach when optimising the parameters
- In this case, we call them _non-linear parameters_
- They have the following _tipycal properties_:
	- Multiple local optima
	- We _approximate the hypersurface near the local optima_ using a 2nd order taylor series
	- No analitical solutions
	- Only iterative methods can find a solution
	- Practicaly impossible _on-line optimisation_
- Then talking about _local nonlinear optimisation_ we mean the optimisation in the vicinity of a chosen _initial search point_
- This is how we find the closest local minimum
- We search the _broader space_ using the so-called __multi start technique__ and picking the best solution
![[Pasted image 20250224143254.png]]

