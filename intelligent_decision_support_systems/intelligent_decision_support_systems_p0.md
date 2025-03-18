# Introduction
- Subdomain of artificial intelligence, converned with how to _optimise the systems for decision making_
- __Decision making:__ the process of deciding how a system will behave, based on previous knowledge and experience
	- The knowledge and experience are most commonly _written as models_
- __Model-based decision making:__ We utilise models when analising, simulating and predicting the behaviour of systems. In engineering they are used to design new processes, analise existing ones or designing _control systems_.
- __Non-linear models:__ Makes sense where a system works in a _borad range of operation_. First, we need to evaluate, whether this is necessary, so we build a _linear model first_, if this does not suffice, then we start working on the non-linear one
## Model use cases
### 1. Prediction
- Predicting the _output for several steps in advance_ is called _multi-step ahead prediction_. The ammount of predicted steps $h$ is called _the prediction horizon_, we can use 2 alternative prediction methods
	- The model can directly predict $h$ steps. This kind of model must _include future input signals_. It's drawback is, that the _dimension of the problem grows with the size of the horizon_, and that we can only predict the value at the horiozn, where we also need the predisctions for $1,2,\cdots, h-1$ steps ahead
![[Pasted image 20250217114524.png]]

### 2. Simulation
- A common use case in _optimisation problems, control and fault detection_
- Used as a _software sensor_, used to replace a physical sensor
- Simulation is a _closed loop structure_, which increases the complexity of the modelling task and identification. Requires extra attention regarding the _stability of the model_
![[Pasted image 20250217114756.png]]

### 3. Optimisation
- We use a model in the case of _optimising a certain cost function_, which enables us to find the _optimal shape of the input signal to the process_
![[Pasted image 20250217114948.png]]

### 4. Analisis
- Using a model when _identifying and understading the behaviour of a process_ in different cases with different model parameters and inputs
![[Pasted image 20250217115143.png]]

### 5. Control
- Modern control systems are based on a _model of the process_, which enables the implementation of the whole process information and it's _uncertainty_
#TODO 

### 6. Fault detection
#TODO 

## Identification steps
- Choosing the model inputs
- Choosing the *input signal shape*
- Choosing the _model architecture_
- Choosing the _type of model dynamics_
- Choosing the _model order_
- Choosing the _structure and complexity of the model_
- Model _parameter estimation_
- Model _evaluation_

![[Pasted image 20250217121904.png]]

1. Choosing the model inputs offers _4 choices_
	- Using all inputs: leads to _smaller dimension models_ with a higher number of parameters. We use it in combination with _regularisation, which prevents overfitting and overparametrisation_ by adding more parameters to the cost function
	- Testing _all input combinations:_ This strategy leads to the best solution, but is not used in practice, because _the number of trials grows geometricaly with the number of inputs_
	- *Unsupervised* input selection: Very useful and based on the _principal component analysis_ approach, which _enables the elimination of redundant inputs_ in a relatively simple manner
	- *Supervised* input selection: Inputs are selected to the criteria of _getting the best possible accuracy of the model_. We use correlational analysis for linear models. In the case of _non-linear models_, this becomes an optimisation problem, which can be solved with _evolutionary algorithms_
2. Choosing the _input signal shapes:_ requires a priori knowledge of the process and purpose of the model. In the case of _black boz modelling_, the measurements are the most important and only source of information. We cannot identify the behaviour of a system in the area where it hasn't been measured. This _limits the quality of the model_
3. Choosing the _model architecture_
	- Depending on the _problem domain:_ (classification, prediction, approximation,...)
	- Depending on the *use-case:* (simulation, optimisatio, control, fault detection,...)
	- Depending on the _problem dimension:_ The number of relevant inputs and outputs limit the choice of architecture
	- Depending on the _availability of data:_ Hard to build a good local model with lackluster or noisy data
	- Depending on the _limits of development_, whether monetary or scheduling limits
	- Depending on _memory limits:_ in some cases the memory capabilities are still very limited, so we can't have too complex of a model
	- Depending on the *processing coupling:* not all models can be used for online processing
	- Depending on _user experience:_ the user tends to use the methods he's familliar with
	- Depending on the _accessibility of tools_
	- Depending on _user acceptance:_ Some architectures are controversial in the general public
4. Choosing the _model dynamics_ Is the most dependent on the model being used, 
5. #TODO 
6. #TODO 
7. #TODO 
8. #TODO 

## Influence of the method parameters
- These are the parameters that cannot be set automaticaly, but are _set by the user_. Some examples include learning rate or number of hidden layers in neural networks
- These parameters are usualy set via human intervention during simulation execution
#TODO dopolni

## Theoretical, experimental and combined models
- Theoretical modeling is based on the _equilibrium equations_. These models are not based on measured data, but the physical properties of the system
- Experimental modeling is based on measured data, we need to _determine the structure and parameters of the model_ based on the measured input and output data. The parameters don't necessairly have a physical interpretation
- __Combined modeling:__ represents a compromise metween the theoretical and experimental approach. Usualy, _thje structure of the model is determined from theoretical knowledge of the process_, while the _parameters are determined experimentaly_

|                      | White box                                                                                               | Grey box                                         | Black box                                                                                                            |
| -------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------- |
| **Potrebno znanje**  | fizikalni zakoni, poznavanje procesa                                                                    | kvalitativno znanje (pravila), znanje in podatki | eksperimentiranje, podatki                                                                                           |
| **Prednosti**        | dobra ekstrapolacija, dobro razumevanje delovanja, velika zanesljivost, reskaliranje                    |                                                  | kratek čas razvoja modela, malo znanja o procesu, lahko jo uporabimo kot dopolnilo tudi za nerazumljive procese      |
| **Slabosti**         | časovno potratno, potrebno procesno znanje, natančnost odvisna od znanja, samo za dobro poznane procese |                                                  | nezanesljiva ekstrapolacija, ne moremo ga reskalirati, natančnost podatkovno odvisna, pridobim malo znanja o procesu |
| **Področje uporabe** | optimizacija, konstruiranje za enostavne procese                                                        |                                                  | samo za obstoječe procese, za zahtevne procese                                                                       |


## Terminology
- __Process:__ Used as a synonim for an industrial process or sysrem, that we're exploring. Could be static or dynamic
- __Learning:__ The _optimisation of a structure_, to reach an optimal value of the _cost function_. If the emphasis is on the optimisation of the _structure_, we usualy talk about learning. When  the emphasis is set on the _search for optimal parameters_, we usualy talk about _estimation_
- __Generalisation:__ Evaluating the model for an _input vector that wasn't featured in the training set_, it's reffered as _interpolation, when it's within the learning region_ and _extrapolation if it's outside the scope of the training data_

# Intro to optimisation
We can diversify between _three different approaches to optimisation:_
- Supervised learning
	- Looking for relations in _input/output pairs_. We know the desired output for every input.
- Reinforcement learning
	- We *don't know the output of the process for each input vector*, we give the model reinforcements when it displays desired behaviour 
- Unsupervised learning
	- We only care about _the input data_, the main objective is to determine the _relations between the input vectors_ and grouping them accordingly

We define a model as a function, that _maps the input vector to a scalar output_
- The model is _parametrised_ with $n$ parameters, which we can store in a _parameter vector_ $\mathbf{\Theta}$
- The goal of optimisation is _finding the parameters, that will minimise the error function of the response of the model and actual system_
- It's the _process of finding a solution_ in an $n$-dimensional _parameter space_
![[Pasted image 20250217134527.png]]

## Supervised learning cost functions
1. Method of _least squares_ $$I(\Theta) = \sum_{i=1}^N e^2(i) \quad ; \quad  e(i)=y_{sistem}(i)-y_{model}(i)$$
2. _Weighted square error_ $$I(\Theta) = \sum_{i=1}^N q_i e^2(i)$$This is an expansion of the _least square method_, where each contribution is weighted with $q_i$, this is the generalised form of it:$$I(\Theta) = \left(\sum_{i=1}^N q_i||e(i)||^p \right)^{1/p}$$![[Pasted image 20250217135538.png]]
#HOMEWORK prove that when p goes to infinity, the parameters will minimise the maximum error in the set
3. Method of *highest likelyhood*
	-  None of the previously mentioned methods has included the _assumption of noisy measurements_, so consequentialy, the _error has the same distribution as the noise_
	$$I(\theta) =- \frac{N}{2}\ln{2\pi}-\frac{N}{2}\ln{\sigma^2}-\frac{1}{2 \sigma^2} \sum_{i=1}^Ne(i)^2$$ optimalni parametri so tisti, ki maksimizirajo zgornjo _funkcijo podobnosti_

## Unsupervised learning cost functions
