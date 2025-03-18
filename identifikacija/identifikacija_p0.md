## Identification of dynamical systems
- Identifiaction is _modeling based on system observation_. Its an essential ingredient of modern sciences
- Different than theoretical modeling with knowlege of the physical characteristics of the system
- A term also used for the concept is __experimental modeling__
- The goal of identifiaction is _to determine a system model based on available measured data_
- Theoreticaly the model can be obtained without any knowledge about it (_black box_)
- Measured data is _usualy imprecise due to problems with sensors_
- Real systems are alsway more complex than their models

## Theoretical modeling vs identifiaction
![[Pasted image 20250217083324.png]]

- Theoretical modeling is often too complex and needs to be simplified before being useful
- Theoretical modeling gives a _good overview of the structure of the system_, which we can utilise when performing _experimental modeling_
- Where a theoretical model includes _functional relations_ between physical and model parameters, an experimental model features _parameters that are usualy numerical values without an obvious relation to the physical parameters_
- So to conclude:
	- __Theoretical modeling__ $\rightarrow$ _model structure_
	- __Experimental modeling__ $\rightarrow$ _model parameters_

| Theoretical modelling                                       | Identification                                                |
|------------------------------------------------------------|--------------------------------------------------------------|
| Model structure follows from laws of nature               | Model structure must be assumed                              |
| Modelling of the input/output behaviour as well as the internal behaviour | Only the input/output behaviour is identified               |
| Model parameters are given as functions of system properties | Model parameters are “numbers” only, in general no functional dependency to system properties known |
| Model is valid for the entire class of processes of a certain type and for different operating conditions | Model is only valid for the investigated system and within operating limits |
| Model coefficients are not known exactly                  | Model coefficients are more precise for the given system within the operating limits |
| Models can be built for non-existing systems              | Model can only be identified for an existing system         |
| The internal behaviour of the system must be known and must be describable mathematically | Identification methods are independent of the investigated system and can thus be applied to many different systems |
| Typically a lengthy process which takes up much time      | Fast process if identification methods exist already        |


- In this subject, we will be trating the systems as _linear and time invariant_
- All _zero order systems_ are __static__


## Identified system
- Identified systems can be _described by the following schematic:_
![[Pasted image 20250217090231.png]]
- The system is influenced by the input $u(t)$ and a _disturbance_ $v(t)$,  a modeller can only change the system input, with no control over disturbance. The disturbances can be _further classified_ into:
	- _Measured_:  Can be measured directly
	- _Unmeasured:_ Their effect can only be observed based on system output

## Important aspects of identification
- Structure is very important when identifying a static system. 
	- If the wrong structure is assumed, it seems like _every measurement requires it's own model_
- Another important step is _signal preprocessing_. We ight have some output data for which the input is unavailable. The model wil _assume the wrong relations_ in such cases
- When identifying a _noisy static model_, its very important that the estimate _converges_ with the true value wnen the number of measurements increases. If we don't see any improvement with the number of measurements, we need to *take a different approach*
	- For example: classical averaging does not cause convergence when the number of measurements increases, so we choose the method of _least squares_
- The influence of _noise distribution_:
	- The measurement of error depends on the noise distribution
	- If we have normal/Gaussian distribution, _parameter variance_ is a sufficient error measurement
	- In case of other distributions, this measurement is insufficient
	- The _central limit theorem_ states, that the distribution of parameter estimates converges to a gaussian distribution
- Noise entering the regressor:
	- When noise enters the regressor, it leads to _biased estimates_, so the peak of the normal distribution moves off-center. The bias size is dependent on the _signal/noise ratio_ of the regressor
- Overestimation:
	- The estimated parameters become _correlated_
	- We should stick to the _minimal ammount of parameters possible_
	- The extrapolation of an identified model is always problematic, but it becomes even harder when dealing with an _overestimated one_

## Practical limitations
- Measured signals are always _corrupted by disturbances_ such as noise...
- _Finite_ measurement time
- The input signal can only be _changed by a certain ammount_, either due to actuator limits, or the assumption of linearity
- The _shape of input signals_ is often confined due to actuator or hardware properties

## Steps of the identification process
1. Definition of a _model purpose_
2. Collection od _a priori knowledge_
	- encompasses all readily available information about the process, being modelled
3.  Planning of measurements and equipment
	- shape/type of signals (general tendence towards varied, dynamic signals)
	- Sampling time
	- Opennes of the loop
	- Disturbance filtering
4. Measurement
5. Identification *algorithm choice*
	- Determines the identified model based on measurements
6. Model _validation_
	- Tests done on the measurements not used in the identification algorithm
7. If the final model does not _fulfill the model purpose_, some steps have to be _repeated_

## Classification of identification methods
- According to the given definition of identification, the methods can be classified based on:
	- Class of mathematical models
		- Parametric (models with structure and parameters)
		- Non-parametric (no structure, infinite number of parameters, like a LUT)
	- Class of employed test signals
		- Based on continuity into *continuous or discrete*
		- Based on the signals nature, they can be either _deterministic or stochastic, or pseudo-stochastic_
	- Calculation of error between the process and model`
		- Output error
		- Input error
		- Generalised equation error (model is divided into 2 parts)
- There are _2 types of coupling between process and computer:_
	- Offline: measured data is stored and transferred to the computer to be processed
	- Online: The identification is performed _parallel to the process measurement_
- Methods can be classified according to the _type of algorithm_
	- Batch processing 
	- Real-time processing

## Identification models
- Parametric models
	- Continuous:
		- Differential equations
		- Continious TF
		- Continuous state space
	- Discrete:
		- Difference equations
		- Discrete TF
		- Discrete SS
- Non-parametric models
	- Frequency response
	- Step response
	- Impulse response

### Models of continuous systems
- LTI process with _lumped parameters_ can be described by ordinary linear differential equations with constant coefficients
- This can be transformed into a transfer function via the Laplacian transform
- The product in _frequency domain_ corresponds to _convolution in time domain_
- A parametric continuous model of a continuous process is _characterised by its parameters_
	- The parameters are the coefficients ($a_n, b_n$) of the ODE
- A non-parametric model can be derived from the parametric one, via the _impulse response_, by multiplying the TF with the Laplace transform of the _Dirac impulse_
- An alternative non-parametric model is the _frequency response:_
	- We use a _harmonic excitation function_ $$u(t) = U_0 \sin(\omega_0t + \phi_u)$$the system also _responds with a harmonic signal of the same frequency_ $$y(t) = Y_0 \sin (\omega_0t + \phi_y)$$
	- The _amplitude ratio_ is defined by the amplitude response $\frac{Y_0}{U_0} = |G(j\omega_0)|$
	- The _phase difference_ is defined by phase response $\phi_y - \phi_u = \angle|G(j\omega_0)|$

### Trensformations between models of continuous systems
- The transform from the impulse response $g(t)$ to transfer function $G(s)$ $$\begin{gather}G(s) = \mathcal{L}\left\{g(t) \right\} && g(t) = \mathcal{L}^{-1}\{G(s)\}\end{gather}$$
- Frequency response $G(j\omega)$ to transfer function $G(s)$ $$G(j\omega) = \lim_{s\rightarrow j\omega}G(s)$$
- Impulse response $g(t)$ to frequency response $G(j\omega)$$$\begin{gather}G(j\omega) = \mathcal{F}\left\{g(t) \right\} && g(t) = \mathcal{F}^{-1}\{G(j\omega)\}\end{gather}$$where the $\mathcal{F}$ denotes the _Fourier transform_ 
	- The connection between frequency response of the _system_ and Fourier transform of the _input and output signals_ $$G(j\omega) = \frac{Y(\omega)}{U(\omega)}$$where $Y(\omega)$ and $U(\omega)$ denote the _Fourier transforms of the input and putput signals_, while $G(j\omega)$ denotes the _frequency response_ of the system.

## Simple identification methods for continuous systems
### Strejc identification method
- Most often used when dealing with _proportion al or integral_ process
- Proportional process responds with a finite steady state change when excited with a step input
- Integral systems respond by _unbounded response_ when excited with a step input. The asymptote is polynomial
![[Pasted image 20250224092724.png]]

| Type   | Transfer Function $G(S)$              |
| ------ | ------------------------------------- |
| $PT_0$ | $G(S) = K_S$                          |
| $PT_1$ | $G(S) = \frac{K_S}{T_{S+1}}$          |
| $PT_2$ | $G(S) = \frac{K_S}{(T_1s+1)(T_2s+1)}$ |
| $PT_n$ | $G(S) = \frac{K_S}{(Ts+1)^n}$         |
| $IT_0$ | $G(S) = \frac{K_I}{s}$                |
| $IT_n$ | $G(S) = \frac{K_I}{s(Ts+1)^n}$        |

- In order to identify the system using the Strejc method, we need to identify some *characteristics of the step response* of the system
	- The __lag time__ $T_l$ (the delay between the beginning of the _excitation_ and the beginning of the _system repsonse_)
	- the __rise time__$T_r$ (the time needed for the system response to reach the _final value_ )
	- the __static gain__ $K_s$ (the gain of the syistem in its steady state) $K_s = \frac{\Delta Y}{\Delta U}$
- We decide on the _process model_ based on the __relationship between $T_l, T_r$__
	- If the relationship: $$\frac{T_l}{T_r} < 0.104$$ stands, the system is __2nd order proportional__, we choose the _following model_
	- From there we construct the _process model:_ $$G(s) = \frac{K_s}{(T_1s+1)(T_2s+1)}$$ with the procedure: $$\begin{gather}\frac{T_l}{T_r}\rightarrow \frac{T_2}{T_1} \rightarrow T_1 \rightarrow T_2 \end{gather}$$
	- If the relationship:$$\frac{T_l}{T_r} > 0.104$$ stands, the system is __higher order proportional__, we choose the _following model_$$G(s) = \frac{K_s}{(Ts+1)^n}$$ with the procedure: $$\begin{gather}\frac{T_l}{T_r}\rightarrow n  \rightarrow \frac{T_l}{T} \rightarrow T \end{gather}$$
	#TODO integral systems

### Model tuning methods
- The process and the model are _excited with the same signals_, the putput error is the _difference between both outputs_
- The _input error and generalised error_ also exist
- This becomes an __optimisation problem__
![[Pasted image 20250224095004.png]]

#### Output error method
- The process and model are connected in _parallel_
- Model has to be realised in the _recursive form_
- The approach can be used either on discrete or continuous models
- Both _offline and online_ realisations are possible

#### Input error method
- The use of this method is _limited to systems with a causal inverse model_, but if we process it offline, the prediction of $y$ from storage is fed into an _inverse model_, thus  making the inverse modela _causal_

#### Generalised error method
- Used to make parameter estimations problems *linear in parameters*
- Often very useful, for example when estimating the transfer function parameters of discrete systems.
![[Pasted image 20250224095641.png]]
The _model 1 and model 2_ blocks represent the _numerator and denominator of the model_


### Simple method of identification of non parametric models
We will be dealing with the _estimation of the frequency response_
- The process is excited by a harmonic signal of certain frequency
-  We assume the process is linear. The response becomes harmonic after the transient
- Combining the complex amplitude and phase responses yields the _frequency response_
- We can generate the freiquency response using one of 2 methods:
	- Sine wave signal generation with a digital computer:
		- It has known oscilation frequency
		- It runs in an open loop
	- __Relay feedback__
#### Relay feedback
- The system starts _oscilationg_ around the operating point
	- The output stays near the operationg point because of _feedback_linear in parameters
	- The frequency needds to be estimated, the oscilation frequency cannot be a multiple of the sampling frequency
- The input signal is a _series of pulses_, while the output is closer to a _sine_, where the input and output have _opposite phase_
![[Pasted image 20250224100511.png]]

# Correlation functions
#TODO intro to statistics up to the standard deviation (seperate document)
- Measured data is almost always _noisy_, so we need to introduce the theory of _Stochastic signals_
- If stochastic signals are mutualy dependent, the dependency can be evaluated by correlation functions
	- Auto-correlations evaluates the _dependency between a signal and it's time shift_ $$\phi_{uu}(\tau) = E\{u(t)u(t+\tau)\}$$
	- According to the _ergodic hypothesys_, one can obtain the same statistical infromationcfrom _averaging a single sample function over time_ $$\phi_{uu}(\tau) = E\{u(t)y(t+\tau)\} = \lim_{T_i\rightarrow\infty}\frac{1}{T_i}\int_{-\frac{T_i}{2}}^{\frac{T_i}{2}}u(t)u(t+\tau) \,dt$$ where $T_i$ is the integration interval
- The same holds for _cross-correlation_ $$\phi_{uy}(\tau) = E\{u(t)y(t+\tau)\} = \lim_{T_i \to \infty} \frac{1}{T_i} \int_{-\frac{T_i}{2}}^{\frac{T_i}{2}} u(t)y(t+\tau) dt$$
- The cross correlation between the input and oputput signal is a _convolution o auto-correlation and the impulse response_
- The _impulse response_ can be obtained using _deconvolution_ between the cross-correlation and auto-correlation

# Tags:
#identifikacija