# From robots to autonomous agents
- __Definition of a robot:__ An electronically controlled device that uniformly performs the pre programmed tasks that are often harmful to human health.
- __Definition of an autonomous agent:__ A system that is:
	- Situated within and/or a part of an environment
	- Senses the environment
	- Acts on the environment over time
	- In pursuit of its own agenda
- Examples of non-biological autonomous agents:
	- Autonomous robots
	- Program agents
	- Virtual assistants
	- Artificial life agents
	- Computer viruses and worms
__The basic model of autonomous agents:__
![[Pasted image 20241010153031.png]]

## Man as an autonomous agent
- Man is the ultimate example of a autonomous agent
- With artificial agents, we attempt to imitate and surpass the capabilities of humans in solving the selected tasks

## Questions
1. What are the types of robots based on their usage?
2. What are the types of robots according to their kinematics or locomotion?
3. What is the definition of an autonomous agent?
4. Give some examples of autonomous agents

# Artificial perception
Perception is _the process of recognizing and interpreting sensory stimuli that enable an agent to be aware of the presence of objects or other agents as well as their mutual relations in its surrounding environment._

Perception is the basis of _cognition_, which is the process of translating the obtained _perceptions_ about the environment into relevant concepts
- **Recognition**: Perception of already known objects, relations, and events.
- **Artificial perception**: Imitation of these processes implemented in artificial autonomous agents.

## Pattern Recognition System 
Usually consists of:
- A sensor unit for data acquisition 
- A unit for feature extraction 
- A unit for pattern classification 

Such pattern recognition systems work in two modes: 
1. **Training mode**: System adapted to the application domain 
2. **Operation mode**: System classifies objects in the application domain

- In the training mode, a finite set of samples is mapped into a training set, that is then used by training algorithms
- The results of the training algorithms are prototypes used for pattern matching decision functions. These are then used by the working algorithm that classifies test samples

__Example:__ A system for detecting defects on electromechanical devices, that is based on the analysis of vibrations (sounds)
![[Pasted image 20241010155258.png]]


## Artificial perception based on image analysis
- In computer vision, the process of artificial perception is performed by computer algorithms that analyse and _partition_ the input images into _sub-segments_ or _regions_, that represent some meaningful entities (objects, creatures, ...) and identify their mutual relations
![[Pasted image 20241010160010.png]]

### Visual perception of images
- Human visual perception is not a simple mapping of the stimuli of the retina into some symbolic representation
![[Pasted image 20241010160200.png]]
_In the image above we can see how the perception changes as the image gets smaller, it transitions from Einstein to Marilyn Monroe_

- Optical illusions reveal complex characteristics of human perception of images
![[Pasted image 20241010160416.png]]
![[Pasted image 20241010160457.png]]

_In the above images we notice how our brain fails to perceive the difference between the images when they're in the opposite orientations, but notice the difference when both images are in the same orientation_

### Computational algorithms for segmentation of images
- Image segmentation techniques based on identifying _homogeneous_ image regions
- Image segmentation techniques based on detecting image contours
- Detecting object regions using internal images and cascade classifiers
![[Pasted image 20241010162044.png]]

#### Thresholding
![[Pasted image 20241010162345.png]]

#### Canny edge detection
- Edge detection operation that uses a multi stage algorithm to detect a wide range of edges in images
#### Contour detection using the Hough transform
- The purpose of this technique is to find imperfect instances of objects within a certain class of shapes by a voting procedure
![[Pasted image 20241010162544.png]]

#### Detecting object regions using integral images and cascade classifiers
- The Viola-Jones algorithm, that is often used has four stages:
	- Haar feature selection
	- Creating an integral image
	- Adaboost training
	- Cascading classifiers

![[Pasted image 20241010162854.png]]
## Artificial perception of sound
- Analyzing and partitioning of sound signals into sub-segments that represent some meaningful entities and identifying their mutual relations
- In the case of audio perception, sound sources often overlap and their spatial localisation in the surrounding environment is required
- In the field of developing artificial intelligence, speech perception and recognition have special importance
- Spoken language represents a foundation of human reasoning and intelligence

### Segmentation of speech signals
- Speech signal segmentation is based on the measurements of different short-term fature, such as loudness, pitch or zero-crossing rate
- The analysis of short term loudness and zero-crossing rate usually suffice for the segmentation of a speech signal into sentences
![[Pasted image 20241010163821.png]]

### Speech units
- __Words:__ are the smallest meaningful units of a language, i.e. the shortest possible message
- Word segmentation is relatively simple, if the words are pronounced separately. However, words are often pronounced without pauses, which makes the segmentation task difficult or even impossible
- A __phoneme__ is the smallest contrasting unit in the sound system of a language. An __allophone__ is a phonetic variant of a phoneme in a particular language
- __Syllables__ are the phonological building blocks of words. A syllable is typically made of a syllable nucleus (most often a vowel) with optional initial and final margins (typically consonants)
- Speech signal is usually segmented into equally-sized time frames

![[Pasted image 20241010164344.png]]
### Human speech communication process
- Human speech communication process is usually modeled as a sequence of stochastic mappings of random processes

![[Pasted image 20241010164538.png]]

- Spoken languages are usually modeled as finite state transducers

![[Pasted image 20241010164636.png]]

### A FST-based speect to text model
- A cascade of finite state transducers can be merged into one huge unified state model that represents a model of human speech communication system

![[Pasted image 20241010165216.png]]

### Questions
- What is artificial perception?
- What is the relationship between artificial perception, cognition and recognition?
- How artificial visual perception is performed by computer analysis of an image?
- How artificial sound perception is performed by computer analysis of sound?
- Why dealing with spoken languages is so important in the field of developing artificial intelligence
# Artificial inteligence
## What is intelligence?
1. Intelligence is the ability to effectively solve problems in a creative way that is not preprogrammed
2. Intelligence is the ability to take over and adapt the ways that others solve problems for our own needs

## What defines intelligence?
- The ability to _adapt_ to changing circumstances
- The ability to _memorize knowledge_ and of its applications
- The ability of _reasoning_ and abstract thinking
- The ability of _learning_ and comprehending relations
- The ability to assess situations and _make decisions_ accordingly
- The ability to form original and _creative thoughts_

