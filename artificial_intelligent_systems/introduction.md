# 1. From Robots to autonomous agents
## Types of robots :
### According to their usage:
- Industrial and work robots
- Domestic or household robots
- Medical robots
- Personal assistant robots
- Military and police robots
- Entertainment and pet robots
- Research robots

### According to their locomotion and kinematics
- Stationary robots and robotic arms
- Mobile robots with wheels
- Mobile robots with legs
- Swimming robots.
- Flying robots.
-  Swarm robots
## Autonomous agents
__Definition:__
An autonomous agent is a system that:
- Is _situated within and/or part of an environment_: It operates within a specific context or domain, interacting with its surroundings.
- _Senses the environment_: Uses sensory mechanisms (e.g., sensors, data inputs) to gather information about the state of the environment.
- _Acts on the environment over time_: Engages in actions or behaviors that influence its surroundings or internal state.
- Pursues **its own agenda**: Operates with a degree of independence and goal-directed behavior, often driven by programmed objectives, learning mechanisms, or adaptive strategies.

### Examples of non-biological autonomous agents
#### Physical Agents:
- _Autonomous robots_: Self-driving cars, robotic vacuum cleaners, drones, and industrial robots.

#### Software Agents:
- _Program agents_: Search engine crawlers, recommendation systems, automated trading bots.
- _Virtual assistants_: Siri, Alexa, Google Assistant.

#### Biological Simulations:
- _Artificial life agents_: Simulated entities in programs exhibiting lifelike behaviors (e.g., Conway’s Game of Life).

#### Malicious Agents:
- _Computer viruses and worms_: Examples include Stuxnet, WannaCry ransomware.

### Key characteristics
- _Autonomy_: Operates without constant human intervention.
- _Perception_: Collects and interprets data from the environment.
- _Adaptability_: Adjusts actions in response to changes in the environment.
- _Goal-Oriented_: Functions to achieve specific objectives.
- _Persistence_: Interacts with the environment over time.

### Applications
- _Industry and Manufacturing_: Robotic assembly lines, quality control, logistics.
- _Healthcare_: Virtual healthcare assistants, diagnostic tools, robotic surgeries.
- _Transportation_: Autonomous vehicles, drone deliveries.
- _Entertainment_: Game AI, virtual reality agents, content recommendations.
- _Cybersecurity_: Threat detection and mitigation.
- _Scientific Research_: Exploration rovers, climate modeling, automated data analysis.

### Challenges
- **Ethics**: Aligning actions with societal values and preventing harm.
- _Reliability_: Ensuring consistent performance in diverse conditions.
- _Security_: Protecting against hacking and manipulation.
- _Transparency_: Making decision-making processes clear and accountable.
- _Control_: Balancing autonomy with human oversight.



# 2. Artificial perception
__Definition:__
- _Perception_ is the process of recognizing and interpreting sensory stimuli, enabling an agent to:
    - Be aware of objects or agents in its environment.
    - Understand the mutual relations among those objects or agents.
- It forms the basis for:
    - _Cognition_: Translating percepts into meaningful concepts (_e.g., identifying objects and their roles_).
    - _Recognition_: Identifying known objects, relationships, or events (_e.g., recognizing a familiar face or sound_).
## Artificial Perception
- _Artificial perception_ imitates human perception processes and is implemented in artificial autonomous agents.
- It involves:
    - **Analyzing sensory data** to identify patterns or anomalies.
    - **Partitioning input data** (e.g., visual or auditory) into meaningful segments for processing.
## Pattern Recognition Systems
A basic system for artificial perception typically involves the following:
### Components:
1. _Sensor unit_: Acquires raw data from the environment (_e.g., cameras, microphones, vibration sensors_).
2. _Feature extraction unit_: Processes raw data to extract relevant features (_e.g., edges in images or pitch in audio_).
3. _Classification unit_: Categorizes patterns into predefined classes (_e.g., recognizing an object as a car_).
### Operational Modes:
1. **Training Mode**:
    - Maps a set of training samples into a structured dataset.
    - Uses training algorithms to generate _prototypes_ or _decision functions_ for classification.
2. **Operation Mode**:
    - Applies learned decision functions to classify new test samples.
### Example Application:
- _Defect detection in electromechanical devices_:
    - Vibration patterns are analyzed to classify a component as "healthy" or "faulty."

## Artificial Perception Based on Image Analysis
### Key Process:
1. _Input images_ are analyzed using algorithms to:
    - **Segment images** into sub-regions that represent meaningful entities (_e.g., objects, features_).
    - **Identify relationships** between sub-regions (_e.g., object positioning_).
### Computational Techniques:
1. _Segmentation_: Dividing an image into regions based on similarity or continuity.
2. _Contour detection_: Using algorithms like the **Canny edge detector** to highlight boundaries.
3. _Hough Transform_: Detecting imperfect shapes in an image via a voting mechanism.
4. _Integral Images and Cascade Classifiers_:
    - Used in object detection (_e.g., Viola-Jones algorithm_).
    - Stages:
        1. Haar feature selection.
        2. Integral image creation.
        3. AdaBoost training.
        4. Cascading classifiers for efficient detection.

## Artificial Perception of Sound
### Key Concepts:
1. **Signal Segmentation**:
    - Analyzes sound signals to partition them into meaningful sub-segments (_e.g., phonemes, syllables_).
    - Uses short-term features like:
        - _Loudness_
        - _Pitch_
        - _Zero-crossing rate_
2. **Spatial Localization**:
    - Identifies the location of overlapping sound sources in the environment (_e.g., detecting multiple speakers in a room_).
### Applications:
- _Speech Perception and Recognition_:
    - Focus on identifying words, phonemes, and syllables for:
        - _Speech-to-text conversion_.
        - _Voice command systems_.
- _Audio Analysis_:
    - Identifying specific sound patterns for monitoring or diagnostics (_e.g., machinery vibrations_).
- In the field of developing artificial intelligence, speech perception and recognition have _special importance,_ since spoken language _represents a foundation of human reasoning and intelligence._
## Visual Perception of Images
### Human Perception:
- **Characteristics**:
    - Not a direct mapping of retinal stimuli into symbolic representation.
    - Involves complex cognitive processes to interpret visual data.
- **Optical Illusions**:
    - Illustrate how human perception can be influenced by context and assumptions.

### Computational Vision Techniques:
1. _Segmentation Algorithms_:
    - Identify homogeneous regions (_e.g., by color or texture_).
    - Detect edges or contours using techniques like the Canny edge detector.
2. _Object Recognition_:
    - Matches segmented regions to predefined object templates.
3. _Local vs. Global Perception_:
    - Local: Focuses on details of individual regions.
    - Global: Considers the entire scene for holistic interpretation.

# 3. Artificial intelligence 
## Definition of Intelligence
_Intelligence_ can be defined as the ability to:
- _Solve problems creatively_ (_Stephen Jay Gould_).
- _Adapt methods from others for one’s needs_ (_Jack Copeland_).
- Perform tasks involving:
    - _Reasoning and abstract thinking_.
    - _Learning and comprehension_.
    - _Adapting to changing environments_.
    - _Forming original and creative thoughts_.
## Artificial Intelligence (AI): Definitions
1. _Haugeland_: “Making computers think—machines with minds in the full literal sense.”
2. _Charniak & McDermont_: “The study of mental faculties through computational models.”
3. _Bellman_: “Automating decision-making, problem-solving, and learning.”
4. _Winston_: “The study of computations enabling perception, reasoning, and action.”
5. _Kurzweil_: “Creating machines that perform functions requiring intelligence in humans.”
6. _Schalkoff_: “Explaining and emulating intelligent behavior using computational processes.”

Artificial Intelligence refers to _the development of systems or machines_ that can perform tasks typically _requiring human intelligence._ These tasks may include reasoning, learning, problem-solving, perception, and understanding natural language.
## Characteristics of Intelligent Behavior
Intelligent behavior includes:
- _Perceiving and interacting with the environment_.
- _Learning and understanding from experience_.
- _Reasoning to solve problems_.
- _Applying knowledge in new situations_.
- _Communicating and understanding natural language_.
- _Demonstrating creativity, curiosity, and ingenuity_.
## Rational Thinking and Acting
1. **Rational Thinking**:
    - Involves formal logic: _Correct assumptions lead to correct conclusions_.
2. **Rational Acting**:
    - Requires:
        - _Clear preferences._
        - _Considering uncertainties._
        - _Selecting actions with the best expected outcomes._
## Strong vs. Weak AI
### Strong AI:
- Aims to replicate or exceed human intellectual and cognitive abilities.
- Should demonstrate:
    - _Human-like problem-solving_.
    - _Self-awareness_
### Weak AI:
- Focuses on solving specific tasks (_e.g., medical diagnosis, voice recognition_).
- Does not require:
    - _General intelligence_.
    - _Self-awareness_.
## Goals of Artificial Intelligence
1. Develop systems that:
    - _Think and/or act like humans_ (_Turing Test approach_).
    - _Think and/or act rationally_ (_Rational agent approach_).
2. _Cognitive Science_: Understand and model human reasoning.
3. _Engineering AI_: Build machines to solve problems requiring intelligence.
## The Turing Test
1. **Purpose**:
    - Determines whether a machine exhibits human-like intelligence.
    - A machine passes if it can fool a human interrogator into believing it is also human.
2. **Weaknesses**:
    - A machine imitating human conversation habits isn’t necessarily intelligent.
    - A machine could be highly intelligent but fail to engage in conversation.
    - Human participants may fail due to lack of education or communication skills.
## Applications of AI
AI is used in various fields, including:
- _Medicine_: Diagnostic tools, robotic surgeries.
- _Robotics_: Industrial automation, autonomous vehicles.
- _Education_: Intelligent tutoring systems.
- _Entertainment_: Game AI, content generation.
- _Law_: Legal research and analysis.
- _Military_: Autonomous systems for surveillance and strategy.
- _Commerce_: Personalized recommendations, fraud detection.
- _Space Exploration_: Autonomous rovers and systems.
## Subfields of AI
### Based on Content:
- _Artificial perception_
- _Natural language processing_
- _Machine learning_
- _Robotics and multi-agent systems_
- _Knowledge representation and reasoning_
### Based on Research Fields:
- _Combinatorial search_
- _Expert systems_
- _Pattern recognition_
- _Soft computing_
- _Ambient intelligence and smart environments_
## Milestones in AI Development
1. **1997**: IBM’s Deep Blue defeats chess champion Garry Kasparov.
2. **2005**: A Stanford self-driving car completes DARPA’s Grand Challenge.
3. **2011**: IBM’s Watson beats human contestants in Jeopardy.
4. **2018**: Google Assistant completes a telephone reservation.
5. **2022**: Launch of large language model-based chatbot ChatGPT.
## Future Predictions by Alan Turing
1. Computers with 10⁹ bits of memory will convince one-third of human judges in five-minute tests.
2. Society will accept the term _“thinking machine”_.
3. Learning will become the cornerstone of building intelligent machines.
## Possible Consequences of AI Development
1. _Artilects_: Machines exceeding human capabilities could define a new species.
2. Ethical considerations:
    - _Freedoms and rights of AI systems_.
    - _Security and regulation_.
3. Potential societal impacts:
    - Changes in employment.
    - Enhanced scientific discoveries.
    - Risks of misuse in military or surveillance.

# 4. Introduction to Soft Computing
- **Soft computing** encompasses computational methods designed for modeling and solving complex problems that are difficult to handle with traditional mathematical approaches.
- Unlike conventional (hard) computing, soft computing tolerates:
    - _Imprecision_
    - _Uncertainty_
    - _Partial truths_
    - _Approximation_
- Inspired by the human way of reasoning and decision-making.

## Subfields of Soft Computing:

1. **Fuzzy Computing**:
    - Deals with imprecise and vague real-world knowledge.
    - Mimics human reasoning and decision-making with degrees of reality.
    - Applications include industrial control, decision-making, and image processing.
2. **Neural Computing**:
    - Based on the biological neural system.
    - Artificial Neural Networks (ANNs) are designed for tasks like pattern recognition and data classification.
3. **Evolutionary Computing**:
    - Employs trial-and-error problem-solving approaches.
    - Simulates _natural selection_ principles like mutation and recombination.
    - Utilizes a population of candidate solutions.
4. **Probabilistic Computing**:
    - Incorporates probabilistic models to handle uncertainty in complex systems.

## Characteristics of soft computing:

- Soft computing methods are synergistic and often combined to solve problems that are too complex for individual techniques.
- Combines different computational paradigms for better problem-solving efficiency.

## History of Soft Computing:

- **Fuzzy Logic**: Introduced by Lotfi Zadeh in 1965.
- **Neural Networks**: Inspired by biological systems, starting with McCulloch and Pitts (1943).
- **Evolutionary Programming**: Initiated with Rechenberg’s work in the 1960s.
- Integration of these paradigms began formally under the term "Soft Computing" in 1981 (Zadeh).

### Examples of Evolutionary Computing Techniques:

- _Genetic Algorithms_ (Holland, 1970)
- _Evolution Strategies_ (Rechenberg, 1965)
- _Genetic Programming_ (Koza, 1992)

## Soft computing applications:

- Industrial process control.
- Machine learning models.
- Image and speech recognition.
- Human decision-support systems.

# 5.  Introduction to Machine Learning
## Overview:
Machine learning (ML) is a branch of artificial intelligence that focuses on:
- Modeling environments using data.
- Improving performance on tasks without explicit programming.
- Utilizing techniques from pattern recognition and data mining to uncover insights and make predictions.
## Practical Uses:
- **Predictive Analytics**: Forecasting trends, behaviors, or demands.
- Autonomous systems: Examples include self-driving cars and drones.
- Natural language processing: Applications like virtual assistants and language translation.
- Medical diagnosis: Assisting in identifying diseases or conditions from medical data.
- Fraud detection: Analyzing transaction patterns to identify anomalies.
- Image and speech recognition: Detecting objects or interpreting audio.
## Characteristics:
- Adaptable: Systems can adjust and improve as new data becomes available.
- Generalization: Models apply learned knowledge to new, unseen situations.
- Data-driven: Heavy reliance on data to train and test systems.
## Types of Learning:
### From Nature:
1. Learning through **imprinting**: Fixed knowledge acquisition early in life.
2. **Conditioning**: Associative learning, as demonstrated in Pavlov's experiments.
3. Bayesian learning: Updating beliefs in response to evidence.
4. Memorization: Storing and recalling data as needed.
5. Trial and error: Learning iteratively through feedback.
6. Learning by imitation: Replicating observed behaviors.
7. Insightful learning: Problem-solving using advanced reasoning.
### In Machines:
1. **Supervised Learning**: Learning with labeled data for tasks like classification or regression.
2. **Unsupervised Learning**: Discovering patterns in unlabeled data, such as clustering.
3. Semi-supervised Learning: Combining labeled and unlabeled data.
4. Reinforcement Learning: Learning by maximizing rewards and minimizing penalties.
5. Transfer Learning: Adapting knowledge from one task to improve another.
## Key Concepts of machine learning:
- **Training data**: The foundation for learning.
- **Algorithms**: Processes for extracting knowledge from data.
- Model evaluation: Assessing accuracy on unseen data to validate performance.
## Bayesian Inference in Action:
- **Scenario**: Diagnosing engine issues.
    - Prior probabilities represent initial beliefs about potential malfunctions.
    - Evidence (vibration data) updates these beliefs.
    - Posterior probabilities identify the most likely fault.
- **Outcome**: Bayesian methods provide a structured approach to decision-making with uncertainty.