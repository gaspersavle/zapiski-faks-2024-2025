# 1. Artificial Perception
What is artificial perception?
- __Artificial__ _perception_ is an imitation of the process of _recognising and interpreting sensory stimuli_,  that is implemented in artificial autonomous agents
What is the relation between artificial perception, cognition and recognition?
- __Perception__ is the basis for __cognition__, since we need to perceive our surroundings to form _relevant concepts_ about it. While __recognition__ is the process of _applying already perceived relations_ onto a new set of events
How artificial visual perception is performed by computer analysis of images?
- In computer vision, the process of artificial perception is performed by computer algorithms that analyse and _partition_ the input images into _sub-segments_ or _regions_, that represent some meaningful entities (objects, creatures, ...) and identify their mutual relations
How artificial sound perception is performed by computer analysis of sound?
- Artificial sound perception by computer analysis, is performed by _analising and partitioning the audio signal into sub segments that represent some meaningful entities_ and identifying their mutual relations
Why dealing with spoken language is so important in the field of developing artificial intelligence?
- In the field of developing artificial intelligence, speech perception and recognition have special importance, because *spoken language represents a foundation of human reasoning* and intelligence
# 2. Artificial Intelligence
What is intelligence?
- [[introduction#Definition of Intelligence|Intelligence is]] _the ability to effectively solve problems in a creative way that is not pre-programmed_. Or the ability to _take over and adapt the ways that other solve problems for their own needs_.
What determines intelligent behaviour?
- [[introduction#Characteristics of Intelligent Behavior|Intelligent behavior]] includes:
	- _Perceiving and interacting_ with the environment.
	- _Learning and understanding from experience_.
	- _Reasoning_ to solve problems.
	- Applying knowledge in _new situations_.
	- _Communicating and understanding natural language_.
	- _Demonstrating creativity, curiosity, and ingenuity_.
Define Artificial Intelligence (AI).
- [[introduction#Artificial Intelligence (AI) Definitions|Artificial Intelligence]] refers to _the development of systems or machines_ that can perform tasks typically _requiring human intelligence._ These tasks may include reasoning, learning, problem-solving, perception, and understanding natural language.
What is the difference between strong AI and weak AI?
-  [[introduction#Strong vs. Weak AI|While]] __strong AI__ focuses on the development of machines that _fully achieve or exceed the human intellectual and cognitive abilities_, __weak AI__ focuses on the development of the machines that _can solve specific complex problems_ that _does not require the full range of human mental and cognitive abilities_
What are the goals of AI?
- The field of AI has [[introduction#Goals of Artificial Intelligence|various]] goals, which inclode:
	- The development of a system that think and/or _act as a human being
	- The development of a system that think and/or _act rationally.
	- The development of AI systems is currently more _detdicated to developing systems that_ __think and/or act rationally__
What are the sub-fields of AI?
- The [[introduction#Subfields of AI|sub-fields of AI]] are divided in accordance to 2 criteria, _based on content_ and _based on research field_. They also get divided in accordance to _their field of application_ but this is outside the scope of this question.
	- __Based on content:__
		- _Artificial perception_
		- _Natural language processing_
		- _Machine learning_
		- _Robotics and multi-agent systems_
		- _Knowledge representation and reasoning_,
		- _Planning, problem solving, automatic design_
		- $\vdots$
	- __Based on research field:__
		- _Combinatorial search_
		- _Expert systems_
		- _Pattern recognition_
		- _Soft computing_
		- _Ambient intelligence and smart environments_
		- $\vdots$
What are the applications of AI?
- AI is used in [[introduction#Applications of AI|various fields]], including:
	- _Medicine_: Diagnostic tools, robotic surgeries.
	- _Robotics_: Industrial automation, autonomous vehicles.
	- _Education_: Intelligent tutoring systems.
	- _Entertainment_: Game AI, content generation.
	- _Law_: Legal research and analysis.
	- _Military_: Autonomous systems for surveillance and strategy.
	- _Commerce_: Personalized recommendations, fraud detection.
	- _Space Exploration_: Autonomous rovers and systems.
What are the possible consequences of the development of the AI?
- [[introduction#Possible Consequences of AI Development|AI research]] could have a lot of consequences with potential _societal and ethical_ impacts:
	- It could yield an __Artilect__, or a _successor to the human species_
	- If AI were to represent a new species, the question of _what rights and freedoms_ it should have
	- The _uniqueness_ of these systems comes to mind
	- Potential _security concerns_ of this technology being used for malicious purposes, like _military or surveilance_ applications.
	- There is also _an ecological debate_ going on about the sustainability of current AI systems.

# 3. Soft Computing and Machine Learning
What is Soft Computing?
-  [[introduction#4. Introduction to Soft Computing|Soft computing]] covers a wider field of computational methods modelling and _solving problems that are too complex_ for classical mathematical modelling. Unlike hard (conventional) computing, the _soft computing is tolerant to imprecision, uncertainty, partial truths, and approximation_, which is _inspired by the human way of reasoning_ and decision-making.
What are the aims of Soft Computing?
- It aims to _solve problems that are too complex_ for classical mathematical modelling.
What computing paradigms are covered by Soft Computing?
- The [[introduction#Subfields of Soft Computing|paradigms]] covered by _soft computing include:_
	- _Fuzzy logic_, that deals with imprecise and vague real-world knowledge, mimickiking human reasoning.
	- _Neural computing_, made to mimic the biological neural system, is used for pattern recognition and data classification
	- _Evolutionary computing_ employs trial and error problem-solving approaches, utilising a population approach to extract the optimal "skillset" to complete a problem
	- _Probabilistic computing_ incorporates probability models, to handle uncertainty in complex systems
What is machine learning?
- [[introduction#5. Introduction to Machine Learning|Machine learning]] is _a branch of artificial intelligence_ research, based on _modelling environment from data_ and related to the field of _pattern recognition and data mining_.
What are the types of natural learning?
- There are various types of [[introduction#From Nature|natural learning]], including:
	- Learning with _imprinting_ (unchangeable knowledge)
	- Learning through _conditioning_ (Pavlov)
	- _Probabilistic (Bayesian) learning_
	- Learning with _memorizing_
	- Learning by _trial and error_
	- _Immitation learning_
	- Learning with _understanding and insight_
What are the basic principles of machine learning?
- The [[introduction#Key Concepts of machine learning|basic principles]] of machine learning are:
	- Training data
	- A priori knowledge
	- Training algorithm
	- Execution algorithm
	- Knowledge model
What are the main machine learning methods?
- The [[introduction#In Machines|main methods]] of machine learning are:
	- _Supervised Learning:_ Learning with labeled data for tasks like classification or regression.
	- _Unsupervised Learning:_ Discovering patterns in unlabeled data, such as clustering.
	- Semi-supervised Learning: Combining labeled and unlabeled data.
	- Reinforcement Learning: Learning by maximizing rewards and minimizing penalties.
	- Transfer Learning: Adapting knowledge from one task to improve another.
Give an example of machine learning with Bayesian reasoning.
- In [[introduction#Bayesian Inference in Action|Bayesian inference]], the a priori knowledge is modelled as a _prior belief_ (trust, uncertainty) and is often called prior . In accordance to the _Bayesian theorem_, the belief mode is _adjusted according to the likelyhood of the obtained data._
- Let's set an __example__ of using Bayesian inference in machinelearning. A technician _needs to diagnose a car_ that presents with _unusual sounds._ His _prior beliefs_ are, that 70% of car engines with such noises _had a malfunction_ of type 1, while 20% had a malfunction of type 2, and 10% a malfunction of type 3. The technician performs _a measurement of the engine vibrations_ and _analises them_ with a special diagnostic tool. The diagnostic tool states, that 60% of engines with a type 1 malfunction present with these vibrations, but so do 90% of cars with a type 2 malfunction and 100% of cars with a type 3 malfunction. The technician __combines__ the probabilities of his own _prior knowledge_ and the probabilities from the _diagnostic software_ and makes an educated guess on the type of malfunction. He also __adjusts his prior beliefs__ to the _combined probabilities_.
![[Pasted image 20250120190900.png]]

# 4. Ambient Intelligence
Describe the transition from Artificial Intelligence to Ambient Intelligence.
- While the field of artificial intelligence is very _techno-centric_ as it deals with specific technical problems, [[Ambient intelligent systems#Overview|ambient intelligence]] is supposed to be very unobtrusive and ubiquitous, making it _human-centric_.
What do we mean by "ubiquitous/disappearing computer"?
- It means that the interaction between humans and computers has _surpassed the prevalent desktop work_, making using the computer _ubiquitous_, since we don't have to think about how we use it.
What is the vision of AmI?
- [[Ambient intelligent systems#Vision of AmI|The vision]] of ambiental machine learning is a system, supported by _netowrked information communication technologies_, embedded in everyday objects, which:
	- _recognises_ human presence
	- _adapts_ to the needs of the user
	- _engages in intelligent_ interactions using speech and gestures
	- provides _relaxed_ and unobtrusive experiences
	- _integrates_ multiple environments into a seamless user experience
What is the use-value of AmI?
- _Improvement_ of citizens' safety
 - _New opportunities_ for work, learning and entertainment
 - New forms of health and social care
 - Tackling _environmental problems_
 - Improvement of the _public service_
 - Modernization of the _social model_
 - Support for _democratic political process_
What are the main types of the AmI components?
 - Aml systems feature [[Ambient intelligent systems#Components of AmI|2 main kinds]] of components, _ambient_ and _intelligent_ ones. Ambient components are mainly used to interact directly with the user, while intelligent components handle the intelligent processes that _facilitate the intelligent behaviour of said system_
What are the concerns in the development of AmI?
- There are various [[Ambient intelligent systems#Ethical and Social Concerns|concerns]], social, political and cultural, about the use of ambiental intelligence. which exist due to:
	- The potential _loss of privacy_
	- The _concentration of excessive power_ in individual organizations.
	- The possibility of the development of _excessively individualized and fragmented society_ in which individuals in their hyperreal world will _no longer distinguish between the real and the virtual_.

# 5. Intelligent problem solving
What kinds of problems are considered in the field of AI?
- There are [[Intelligent problem solving#Types of Problems|multiple types of problems:]]
	- _Deterministic and Fully Observable_ (Single-State Problems), where the agent is _fully aware of the current state_ and the solution is a sequence of operations.
	- _Non-Observable_ (Conformant Problems), where the agent has _no information about the current state_ and the solution is a sequence of operations deduced without sensing.
	- _Nondeterministic and Partially Observable_ (Contingency Problems) In these problems, _percepts provide partial information_ and the solution is a tree or a contingent plan.
	- _Exploration Problems_ involve _discovering and learning_ about an unknown state space.
What are typical examples of problem solving?
- The [[Intelligent problem solving#Problem-solving examples| typical examples]] of problem solving are:
	- Assembling products in industrial production (deterministic)
	- Defining the optimum layout of the building blocks of integrated systems. (non-deterministic)
	- Determining the optimal paths with visiting points in space.
	- Rearranging (putting in order) an environment into a final desired state.
	- Making a series of moves that leads to a victory in a game.
	- Proving theorems in mathematics and logics
How problems are solved by search?
- Search is a _fundamental method_ to solve problems that are _not solvable with more simple direct methods_. It provides a framework into which more simple direct methods for _solving sub-problems_ can be embedded.
- The problem is solved by _using the rules and actions_ in combination with an appropriate strategy of _traversing/moving through the problem space until a path from an initial state to the final state is found._
What are examples of single-state problems?
- SIngle state problems are separated into [[Intelligent problem solving#Examples of single state problems|2 categories]] , based on the solution:
	- The problems for which _the solution is a description of the path from the initial to the final state
		- Assembling industrial products,
		- Finding an optimal route on maps,
		- Assembling a puzzle picture,
		- The problem of the _Tower of Hanoi_ ,
		- The _Water Jugs problem_ etc.
	- The problems for which _the solution is only a description of the final state_, like:
		- Finding an optimal layout of elements (integrated circuits etc),
		- Defining the optimal time schedule for different parties,
		- A game of n-queens puzzle,
		- The Sudoku game etc.
What search strategies are used to search problem trees?
- There are a [[Intelligent problem solving#Tree search Strategies|number]] of proposed search strategies, such as
	- Breadth-first search
	- Depth-first search
	- Uniform-cost search
	- Depth-limited search
	- Iterative deepening search
	- Informed search with the use of a heuristic function
In what ways the decomposition of a problem to sub-problems is usually presented?
- The [[Intelligent problem solving#Problem Decomposition|decomposition of the problem]] into sub-problems is *represented by an AND/OR tree*.
-  The *leaves* of the AND/OR trees *are basic sub-problems that are trivial to solve*.
What do represent the nodes in a AND/OR tree?
- Different types of nodes represent [[Intelligent problem solving#Problem Decomposition|different things]]:
	- _Leaves_ represent the lowest level problems, that are _trivial to solve_
	- _Intermediate nodes_ represent sub-problems, _derived from combining simpler solutions_
	- _The root node_ represents the _final solution of the entire problem_
What constitutes a solution to the problem that is decomposed to sub-problems?
- The decomposed problem is [[Intelligent problem solving#Solution Representation|solved by]] *solving its basic problems in accordance with the final problem solving plan*.
-  This *solves the sub-problems in the intermediate nodes* of the AND/OR tree all the way up to the root of the tree, which represents the solution of the entire problem.
How many solutions are contained in the tree with only the AND nodes?
- If an AND/OR tree contains *only AND nodes* then there is *only one possible solution to the problem*, otherwise, there are several.
 - The solution of the problem is *no longer a path, but each subtree of the AND/OR tree containing only the AND nodes*.
How production rules can be represented by an AND/OR tree?
- **AND Trees**: All conditions must be met for the conclusion to hold.
- **OR Trees**: At least one condition suffices for the conclusion.

# 6. Expert systems
What are expert systems?
- Expert systems are systems, trying to _imitate the human reasoning process_, they embody an expertise for solving _certain types of problems_.
What are the basic components of expert systems?
- Expert system consist of:
	- _The knowledge base_, which is a declarative representation of the _expertise_ for solving problems. It usualy contains a _set of rules_, that provide the relations between _possible facts_
	- _Working memory_, which stores the _context and facts_, that have been estabilished in solving a given problem`
	- _Inference engine_, which is a computer program, that _activates the knowledge_ in the knowledge base
	- _User interface_, which enables comunication between the user and expert system
What are the strengths and weakness of expert systems?
- __Strengths:__
	-  Low development costs.
	-  All knowledge of the system is stored in the knowledge base.
	-  The possibility of easily understandable explanation of the decisions made for the users who are not computer experts.
	-  The same system can be used for different problems.
	-  Knowledge of expert staff can be captured to some extent before they move on.
	-  Can be used as a training aid to increase the expertise of staff.
- __Weaknesses:__
	-  They require a lot of detailed knowledge.
	-  Not all domain knowledge fits rule format.
	-  Knowledge acquisition is time consuming.
	-  The results are completely dependent on the accuracy of the knowledge.
	-  They do not have the ability to learn from the experiences with users.
	-  Useless in unexpected operating conditions.
	-  Limited to less extensive knowledge base.
Describe the production system.
- A production system *provides the inference mechanism* necessary to *execute production rules* in order to achieve some goal.
- It consists of:
	- The **knowledge base:** A database of *production rules that provide the relations* between the possible facts
	- The __working memory:__ A *set/list of facts* that may *satisfy premises*/conditions of the rules and *cause their execution*
	- The __inference mechanism:__ An algorithm that *selects and executes the production rules* with respect to the facts (data) in the working memory
Describe forward and backward chaining rules.
 - Forward and backward chainings of rules are both _knowledge base searching thechniques_, used for drawing inference from the knowledge base.
	1. __Forward chaining of rules:__ (Also known as data-driven), can be described logicaly as a repeated aplication of [[Modeus ponens|modeus ponens]]. The algorithm _scans the inference rules_, untill it finds one, where the _condition is true_, therefore, it can _infer_, that the __outcome is also true__. The algorithm is __repeated until__ _the condition matches the desired outcome_, or until  _no more inference rules_ can be checked with respect to the _condition_ (data) in the working memory.
	2. __Backward chaining of rules:__  (Also known as goal-driven), can be described as _searching backwards_ from the desired goals/outcomes. The algorithm _starts with the goal/outcome_ and scans through the knowledge database and chacks, _whether there are any any conditions/data_ that __support the outcome__
How expert systems deal with uncertainty?
- To work in the real world, expert systems must *be able to deal with uncertainty*, this is achieved by:
	- Taking into *account the uncertainties* in presenting the facts.
	- Using *probabilistic theories* that take into account the uncertainty (Bayes, Shannon, ...). 
	- *Assigning confidence factors* (CF) to the facts, premises and consequents.
	- The use of *fuzzy logic and fuzzy rules*.
Give examples expert system shells.
- An expert system shell is a software development environment that *contains the basic components of expert systems*. Some examples of that are:
	- CLIPS - A Tool for *Building Expert Systems*
	- Drools - A business-*rule management system*
	- JLisa - A *Clips-like* Rule engine
	- FuzzyClips
	- Prolog is often used to *build expert systems*

# 7. Knowledge representation forms
Describe the progression of knowledge from data to wisdom.
-  Knowledge development *begins with the data* that is a collection of *disconnected facts* and have limited utility.
-  *Analysis and organization* of the data (building relationships) *create information*.
-  *Interpretation and evaluation* of information leads to *knowledge.*
-  *Understanding of basic principles* that are embedded in the knowledge leads to the *meta knowledge or “wisdom”* (knowledge about knowledge).
What are the differences between implicit and explicit knowledge?
- Knowledge is usually *categorized into two major types*, “Tacit” corresponds to "informal" or "implicit" type of knowledge, while *“Explicit” corresponds to "formal"* type of knowledge.
	- __implicit:__
		- *Embodied* in a human being
		- *Difficult* to formally *articulate*
		- *Difficult* to *communicate*
		- Hard to *steal or duplicate*
		- Drawn from experiences, actions and subjective insight
	- __Explicit:__
		- _Embedded_ into a human being
		- _Can be_ formally _articulated_
		- _Can be_ shared, copied, processed and stored
		- Easy to steal or duplicate
		- Drawn from _artifacts of some type_ as a principle, procedure, process, ...
What are the differences between procedural and declarative knowledge?
Which knowledge representation schemes have been proposed?
- *Different types* of knowledge *may require different formal knowledge representation schemes*
- The _most common_ representation schemes are:
	- Decision tables and decision trees
	- Production rules, rules with exceptions
	- The language of mathematical logic
	- Semantic networs and semantic frames
	- Fuzzy Petri nets
	- Regression trees
What is the Semantic Web?
- The semantic web is *an effort to create a web* that uses the concepts from *semantic networks*. It would allow people (and programs) to *better understand and search web content*.
Give some examples of knowledge representation in a selected knowledge representation scheme.
- My example of a knowledge representation scheme is a __decision table__, they are _the simplest knowledge representation scheme_. Their drawback is the difficulty of matching the attributes and poor flexibility.

| Outlook  | Humidity | __Outdoor plans__ |
| -------- | -------- | ----------------- |
| Sunny    | High     | No                |
| Sunny    | Normal   | Yes               |
| Overcast | High     | Yes               |
| Overcast | Normal   | Yes               |

# 8. Propositional and predicate logic
What are the types of logic?
- The main types of logic are: 
	- informal logic, 
	- formal logic, 
	- symbolic logic
	- mathematical logic.
Give examples of meaningful logical propositions.
- “Drilling for oil caused dinosaurs to become extinct.”
- “ +  =  when  = −”
- “All cows are brown.”
- “Birds have wings.”
- “The Earth is further from the sun than Venus.”
- “There is life on Mars”
- “3 × 3 = 8”
- “The square is a rectangle.”
What logical connectives are used with propositional logic?
-  *Negation* (not): $\neg$ , ~, overline
-  *Conjunction* (and):  $\cdot$ & $\land$
-  *Disjunction* (or): + $\lor$
-  *Material implication* (if...then): ⟹ ⟶ ⊃
-  *Biconditional* (if and only if, iff, ): ⟺ ⟷ ≡
Which proposition is called a tautology and which a contradiction?
- A proposition that is *always true* is called a **tautology**
- A proposition that is *always false* is called a **contradiction**
What are the main rules of logical reasoning?
- Logical *Deduction*
- Logical *Induction*
- Logical *Abduction*
- Use of Logical Connectives
- Natural Deduction Rules
- Inference Rules
- Truth Tables and Equivalences
What is the difference between predicates and propositions?
- A **proposition** is a *declarative statement* that is either true or false, but not both, but a **predicate** is a *statement that contains variables and becomes a proposition when specific values are substituted for those variables*.
What are the two fundamental quantifications in predicate logic?
- An *existential quantification* is a logical constant (∃) that is interpreted as *"there exists", "there is at least one", or "for some“.*
- A *universal quantification* is a logical constant (∀) that is interpreted as *"given any" or "for all"*.
# 9. Prolog
What are the main differences between Prolog and other programing languages?
- Prolog is a *declarative* computer *programming language*. It differs from *traditional imperative/procedural* languages. Prolog clauses are **statements about what is true about a problem**, *instead of instructions how to accomplish the solution*.
Give an example of a Horn clause in Prolog  
- Horn clauses are the basis of logic programming, where it is common to *write definite clauses in the form of an implication*, An example wolud be: `parent(X,Y) :- child(Y,X)
- Which means: *If `Y` is a child of `X`, then `X` is a parent of `Y`.*
Describe the key features of the Prolog syntax.
- **Facts**: Assert basic truths (e.g., `parent(john, mary).`).
- **Rules**: Define logical implications using `:-` (e.g., `parent(X, Y) :- child(Y, X).`).
- **Queries**: Ask questions using `?-` (e.g., `?- parent(john, mary).`).
- **Variables**: Start with uppercase letters or `_` and represent unknowns (e.g., `X` in `?- parent(X, mary).`).
- **Atoms**: Constants starting with lowercase letters or enclosed in single quotes (e.g., `'New York'`).
- **Connectives**:
	- AND: `,` (e.g., `parent(X, Y), parent(Y, Z)`).
	- OR: `;` (e.g., `?- likes(alice, chocolate); likes(bob, chocolate).`).
	- NOT: `\+` (e.g., `?- \+ parent(john, mary).`).
- **Lists**: Ordered collections (e.g., `[Head|Tail]` for list manipulation).
- **Comments**:
	- Single-line: `%`
	- Multi-line: `/* ... */`.
- **Unification**: Matches variables, constants, and structures during evaluation.
What defines a procedure in a Prolog program?
- A procedure consists of *all the clauses that defines the same* *predicate*.
Convert an example of a natural language statement into a Prolog clause.
- _"Linda plays the piano”_ $\rightarrow$ `plays(linda,piano).`
How does Prolog answer questions?
- Prolog answers questions using *logical inference* through a process known as **backtracking**.
What are the inference rules of the Prolog interpreter system?
- The interpreter tries to *accomplish the goals* in the input query in *accordance with specific inference rules*.
	-  A Prolog program is first consulted and the *facts and rules in the program are loaded into the knowledge database.*
	-  The interpreter *considers the input goals (query) from left to right*
	-  It *searches the knowledge database* from top to bottom to find *any clause which head unifies with the considered goal.*
	-  If there is such a clause then *its variables* (if any) *are renamed to preserve the integrity of the program.*
	-  The *head of the clause is unified* with the goal and its *body is added to the beginning of the list of goals.*

# 10. Fuzzy logic
What is the main difference between crisp and fuzzy sets?
- A *conventional* (crisp) set is a set of objects that satisfy a predicate.  *If, for an object, the predicate is true* then the object *is an element of the set*, and vise-versa if the predicate is false.
- A fuzzy set is obtained if, *instead of a predicate, a membership function is used* that provide, *for each element of a universal set:* $X$, *a degree of membership to a set:* $A$.
What is a fuzzy linguistic variable and give its example? 
- Linguistic variables are used every day to express what is important and its context. An example would be: _"This soup is hot"_
What are the main differences between propositional and fuzzy logic?
Give several examples of fuzzy rules.
- A fuzzy rule is defined as a *conditional statement in the form: IF x = A THEN y = B*:
	-  IF pressure is high, THEN volume is small.
	- IF temperature is normal THEN maintain fan.
	-  IF the speed is high, THEN apply the brake a little.
Describe fuzzy reasoning principles. 
What are the main processes of a fuzzy system?
1. _Fuzzification_
2. _Fuzzy inference_
3. _Defuzzification_

# 11. Probabilistic reasoning
Explain why abductive and inductive reasoning are inherently uncertain.
- __Abductive reasoning:__ Infers the most likely explanation for a set of observations.
	`If A→B, and B is observed, then A is likely.`
	- _Why It’s Uncertain:_
		- _Incomplete Explanations_: Other plausible causes may exist. `Wet grass → Rain, but could also be a sprinkler.`
		- _Non-Guaranteed Outcomes_ Premises true ≠ Conclusion true. `Fever → Flu, but could indicate other illnesses.`
		- _Subjectivity_: The "best explanation" depends on context and biases.

- __Inductive Reasoning:__ Draws general conclusions from specific observations.
	`Observation 1, 2, ..., n → General Conclusion.`
	- _Why It’s Uncertain_:
		- _Patterns, Not Proof_: Patterns in the past may not persist. `Sun rises daily → Will rise tomorrow (highly likely but not certain).`
		- _Limited Data_: Observations may not represent the whole. `Observing only white swans → Not all swans are white.`
		- _Revisability_: New evidence can revise conclusions. `Market trends may shift unpredictably.`
Explain how the Modus Ponens rule of inference is generalized to Bayes’ rule.
- The common rule of inference is: $P \rightarrow Q$, _then If $P$ is_  __True__, $Q$ _is also_ __True__
- The _generalised form_ is called the _Bayes' rule_ and states:
```
if P then sometimes Q

P = True
---------------------
Q = maybe True
```
What is the difference between absolute and conditional probabilistic independence?
- $A$ and $B$ are _absolutely independent_ __if and only if:__ $P(A\land B)=P(A)P(B)$ 
- $A$ and $B$ are _conditionaly independent, given $C$_ __if and only if:__ $P(A\land B | C)=P(A|C)P(B|C)$
- Conditional independence is *weaker than absolute independence*, but still useful in decomposing the full joint probability distribution.
Why the probabilistic inference from the joint distribution is usually computationally more demanding than using Bayesian networks.
- Using a Bayesian network is computationally more efficient than inference directly from a joint probability distribution because it leverages **conditional independence**, **efficient marginalization**, and a **compact representation** of the probabilistic relationships among variables. This makes Bayesian networks a practical choice for large-scale probabilistic reasoning tasks.
Give an example of a Bayesian Network
- Bayesian reasoning is an application of _probability theory_ to _inductive and abductive reasoning_.
- It uses _probability theory_ and information about _independence_ as well as reasoning from evidence to general conclusions ([[#1. Explain why abductive and inductive reasoning are inherently uncertainin |inductive reasoning]]) or from causes to effects ([[#1. Explain why abductive and inductive reasoning are inherently uncertain |abductive reasoning]])
- _Bayesian networks_ are a practical way of managing _probabilistic inference_ when multiple variables are involved. They __make assumptions about the relevance of some conditions to others__. Once the assumptions are made, the _joint probabilistic distribution_ can be factored, so that __there are fewer parameters that must be specified__.

1. My example of a simple Bayesian network:
	![[Pasted image 20250119164545.png]]
	- The circles, containing the letters, $A, B, and \space C$ _represent  the variables of the network_
	- The connections, or lack of them, _represent the dependence of the variables:_
		- __No connections__ (edges): The variables have _no dependence_, they are completely independent of each other (in this example A and B)
		- __Directed connection__ (edge): The variables have _conditional independence_
	$$P(A,B,C) = P(C|A,B)\cdot P(A) \cdot P(B)$$

# 12. Neural networks
Describe the basic model of neural networks.
- Artificial neural networks (ANNs) *model the natural biological neural systems*
- A neural system is composed of *simple processing elements (neurons)* that are intricately connected with one another.
	-  A neuron is composed of *input dendrites*, the neuron body and the output axons.
	-  *Stimuli* from the axon of one neural cell *travel through the synapses to the dendrites of other cells*.
What types of artificial neural networks are known?
-  Multilayer feedforward neural networks.
-  Self-organizing neural networks
-  Recurrent neural networks.
-  Hopfield, Boltzmann, and Hamming neural networks
-  Hierarchical Bayesian network
-  Long short-term memory recurrent neural networks
-  Stacked auto-encoders
-  Convolutional deep neural networks
Describe the basic learning method in multilayer perceptrons? 
- Weights (and thresholds) of the MLP neurons are determined using the *error back-propagation algorithm* and using an appropriate *cost (loss) function*.
- The training algorithm *assigns the ‘credit’ or ‘blame’ to individual neurons* involved in forming the overall response of the network, and *alters their weights* to bring the network closer to the desired behavior (by *minimizing the cost/loss function*)
What problems are solved by artificial neural networks?
- They are a powerful system for solving *pattern recognition problems*, like:
	- Time series prediction
	- Classification, novelty detection and sequential decision making
	- Filtering, clustering, blind source separation and compression
	- Image registrations and noise removal
Describe the basic properties of deep convolutional neural networks?
- CNNs are highly efficient at processing *grid-structured data* like images due to their *hierarchical feature extraction*, parameter sharing, translation invariance, and depth. Despite their computational demands, CNNs *excel in tasks requiring pattern recognition* and are the backbone of state-of-the-art solutions in computer vision.

# 13. Genetic algorithms
What is the aim of genetic algorithms?
- Genetic algorithms strive to _solve optimization problems_ by using an approach _inspired by evolution_ where it pseudo-randomly mutates each generations and mixes the best traits for the solution of a specific problem. The _optimisation problem_ is defined as *finding values* of the variables that *minimize or maximize the objective function* while *satisfying the constraints*
What are the main operators of generic algorithms?
- Genetic algorithms are an AI training strategy that _mimics the process of natural selection_, or the survival of the fittest. The basic principles are:
- _selection_
- _reproduction_
- _inheritance_
- _crossover_
- _mutation_
- The average _genetic algorithm_ consist of 6 main steps:
	1. __Start:__ This step generates a random initial population of $n$ chromosomes, this is the starting point from which the algorithm will attempt to _optimise their traits_
	2. __Fitness:__ This step evaluates the fitness of each member of the population, the _fitness_ is usually the value of the _objective function_ in the optimisation problem we're trying to solve
	3. __New population:__ Creates a new "generation" of the population by repeating the following steps untill the _new population is complete_:
		1. __Selection:__ selects 2 _"parent" chromosomes_ from the population, _based on thir fitness_, the higher the fitness score, the better the chance of getting selected
		2. __Crossover:__ applies a crossover of the _parent traits_ to the offspring, without this, _the child would be the exact copy of their parent_
		3. __Mutation:__ With a mutation probability, we _mutate the new offspring_ at each position in the chromosome (each trait) to introduce a perturbation and encourage the betterment of the species
		4. __Selection:__ _Place the_ newly augmented offspring _into the population_
	4. __Replace:__ Use the newly generated population _for a further iteration of the algorithm_
	5. __Test:__ If the _end condition is satisfied_, stop and _return the best solution_ in the current generation
	6. __Loop:__ If the _condition_ in the previous step is _not met, we repeat the cycle from step 2._
How potential solutions of a problem are encoded into chromosomes?
- A potential solution is represented as a _phenotype_, each of these have a _set of properties_, encoded in the _chromosomes_, using an encoding method, which is dependent on on the type of problem being solved
What are the advantages and limitations of genetic algorithms?
- __Advantages:__
	-  Genetic algorithms are usually *simple and are easy to be implemented*.
	-  They can be *parallelized* with a little effort.
	-  Objective functions that are not smooth, are noisy and their derivatives does not exists can still be used as the fitness function for a genetic algorithm.
	-  Genetic algorithms can also handle with the *stochastic nature of objective functions*.
	-  They are *flexible to hybridize* with other techniques.
- __Limitations:__
	-  *Repeated fitness function evaluation* for complex problems is often the *most prohibitive and limiting segment* of genetic
	algorithms.
	-  Where the number of elements which are exposed to mutation is large there is often an *exponential increase in search space size*.
	-  The "better" solution is only in comparison to other solutions, and the *stop criterion is not clear in every problem*.
	-  In many problems, GAs may have a *tendency to converge towards local optima* or even arbitrary points rather than the global optimum of the problem.
	-  GAs cannot effectively solve problems in which the only fitness measure is a single right/wrong measure.
	-  For specific optimization problems, other optimization algorithms may be more efficient in terms of speed of convergence.
Give an example of optimization with a genetic algorithm.
- Searching for a maximum of a multivariable function, this function can even be a controll system, where we _optimize the parameters of the regulator_, like $T_I, K_P, T_D$ to optimise several factors, like _overshoot, time constant, or oscilatory properties._

# 14. Multi-agent systems
What is a multi-agent system?
- A multi-agent system consists of *a number of agents, which interact with one-another*. They are focused on *developing concepts, methodologies and algorithms for autonomous problem solvers t*hat can *act flexibly in uncertain and dynamic environments* in order to achieve their objectives
What is the difference between objects and agents in computer programming?
- __Objects:__
	- encapsulate some state;
	- communicate via message passing;
	- have methods, corresponding to operations that may be performed on their states.
- __Agents:__
	- embody stronger notion of autonomy (they decide for themselves whether or not to perform an action on request from another agent),
	 - are capable of complex and flexible behaviour (they are reactive, pro-active, and social),
	 - are not passive service providers.
Describe the abstract architectures for agents.
- If we assume an environment can be in a _finite number of discrete states_, agents can have a _set of possible actions_, that is the same size as the number of environment states. They can then _use these actions to transform the state of the environment_. A __run__ of an agent is a sequence of interleaved _environment states and actions_
Why the communication between agents is based on the Theory of speech acts?
- This theory deals with languages as a *means by which people achieve their goals and intentions*, where *spoken statements are regarded as a kind of physical actions*, which sometimes *even appear to change the state of the world*.
What is determined by the FIPA standard?
- Agent Communication Language (ACL) messages,
- message exchange interaction protocols,
- speech act theory-based communicative acts
- content language representations.
Describe the Belief–desire–intention (BDI) software model.
-  The BDI software model *implements the principal aspects of Bratman's theory of human practical reasoning*.
-  This model provides a mechanism for *separating the activity of selecting a plan from the execution of currently active plans*.
-  Consequently, BDI agents are able to *balance the time spent on deliberating about plans* (choosing what to do) *and executing those plans* (doing it).
-  Creating the plans in the first place (planning), is not within the scope of the model, and is left to the system designer and programmer.
What are the basic characteristics of the abstract programming language AgentSpeak?
- **Agent-Oriented Programming**:
	- Designed for autonomous, goal-driven agents based on the **Belief-Desire-Intention (BDI)** model.
- **Abstract Language**:
	- High-level, conceptual specification for intelligent agent behavior.
- **Rule-Based Programming**:
	- Behavior defined by rules: triggering event:context⇒plan body\text{triggering event} : \text{context} \Rightarrow \text{plan body}triggering event:context⇒plan body
- **Plan-Driven**:
	- Uses **plans** to specify how agents respond to events and achieve goals.
- **Event-Driven Execution**:
	- Actions triggered by internal/external events using an **event queue**.
- **Logical Reasoning**:
	- Integrates logical conditions in rules for decision-making.
- **Goal-Oriented**:
	- Supports **achievement goals** (reach a state) and **maintenance goals** (sustain a state).
- **Belief Base**:
	- Stores the agent’s knowledge, updated by perception or inference.
- **Intentions**:
	- Represents active plans with dynamic selection and execution.
- **Asynchronous Messaging**:
	- Enables communication and coordination between agents.
- **Simple Syntax**:
	- Minimalistic, expressive syntax for defining behaviors.
	- Example: `+!goal : condition <- action1; action2; subgoal.`
- **Execution Cycle**:
	- Includes **perception**, **event processing**, **plan selection**, and **action execution**.
- **Multi-Agent Systems**:
	- Well-suited for dynamic, collaborative environments.