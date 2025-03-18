# Intelligent Problem Solving
## Overview:
Problem solving is a core aspect of artificial intelligence, involving the process of generating solutions from observed data. Problems are defined by:
- _Goals_: Desired outcomes or states.
- _Objects and relationships_: Elements of the problem and their interactions.
- _Operations_: Actions that can be applied to objects to achieve goals.
## What is a problem?
A problem is characterized by a set of goals, a set of objects and their relations as well as a set of operations on objects that are poorly defined and may evolve during problem solving.
## Types of Problems:
1. **Deterministic and Fully Observable (Single-State Problems)**:
    - Agent is fully aware of the current state.
    - The solution is a sequence of operations.
2. **Non-Observable (Conformant Problems)**:
    - Agent has no information about the current state.
    - The solution is a sequence of operations deduced without sensing.
3. **Nondeterministic and Partially Observable (Contingency Problems)**:
    - Percepts provide partial information.
    - The solution is a tree or a contingent plan.
4. **Exploration Problems**:
    - Involves discovering and learning about an unknown state space.
## Problem-solving examples:
- Assembling products in industrial production (deterministic)
- Defining the optimum layout of the building blocks of integrated systems. (non-deterministic)
- Determining the optimal paths with visiting points in space.
- Rearranging (putting in order) an environment into a final desired state.
- Making a series of moves that leads to a victory in a game.
- Proving theorems in mathematics and logics.
## Problem Space:
- **Definition**: Abstract representation of all possible states and transitions for a problem.
- **Components**:
    - States: Possible configurations of the problem.
    - Operators: Actions that transition states.
    - Final States: Represent solutions.
- **Goal**: Search through the problem space to find a path from the initial state to a solution.
## Formal definition of problems:
A formal definition of a problem requires the following:
- Defining a state space that contains all the possible configurations of the relevant objects that are part of the problem.
- Specifying one or more initial states that describes possible situations from which the problem-solving process may start.
- Specifying one or more final states that describes all the possible situations that are considered to be acceptable solutions to the problems
- Defining a set of rules that describe all the possible actions (operations) on the problem state space, and usually their costs as well.
## Steps in Problem Solving:
1. **Planning**:
    - Define initial and final states.
    - Analyze problem characteristics to choose a search strategy.
    - Identify all necessary knowledge (states, relations, operations).
2. **Formal Definition**:
    - Specify the state space and initial/final states.
    - Define rules for operations and their associated costs.
3. **Execution**:
    - Use rules and strategies to navigate the problem space and find solutions.
## Graph Representation:
- Problems are represented using **directed graphs** where:
    - Nodes represent states.
    - Arcs represent operators.
- Trees are often used for simpler navigation but may duplicate nodes.
## Examples of single state problems:
SIngle state problems are separated into 2 categories , based on the solution:
- The problems for which _the solution is a description of the path from the initial to the final state_, like:
	- Assembling industrial products,
	- Finding an optimal route on maps,
	- Assembling a puzzle picture,
	- The problem of the _Tower of Hanoi_ ,
	- The _Water Jugs problem_ etc.
- The problems for which _the solution is only a description of the final state_, like:
	- Finding an optimal layout of elements (integrated circuits etc),
	- Defining the optimal time schedule for different parties,
	- A game of n-queens puzzle,
	- The Sudoku game etc
1. **Pathfinding**:
    - Finding the optimal route on a map.
2. **Game Problems**:
    - Solving puzzles like the Tower of Hanoi or Sudoku.
3. **Optimization**:
    - Defining optimal layouts or schedules.
## Converting directed graphs to trees:
A set of _all possible paths_ in a directed graph can be _represented as a tree_.
- A tree is a _directed graph_, where all the tree nodes except the root have _exactly one predecessor node_, called its parent.
- The _tree root_ is the node that has no predecessor node.
- The _tree leaves_ are the nodes that have no successor nodes.
- The _branching factor_ of a tree is the average number of node successors.
A directed graph is converted to a tree by _duplicating nodes and breaking cyclic paths_, if they exist

![[Pasted image 20250120234522.png]]
## Tree search Strategies:
Uninformed search strategies use _only the information available_ in the problem _definition_.
- Search can be _exhausted_ (complete and optimal) or _heuristic_ (not necessarily complete and optimal).
1. **Uninformed Search**:
    - Relies only on the problem definition.
    - Examples:
        - Breadth-first search (BFS).
        - Depth-first search (DFS).
        - Uniform-cost search.
    - Evaluated on completeness, computational complexity, and optimality.
2. **Informed Search**:
    - Uses heuristic functions to guide the search process.
    - Examples:
        - Greedy search.
        - A* search.
    - Requires well-designed heuristics for effectiveness.
- Strategies are evaluated using the following criteria:
	- *Completeness*: Does it always find a solution, if it exists?
	- *Time complexity*: The number of nodes generated/expanded.
	- *Space complexity*: The number of nodes holds in memory.
	- *Optimality*: Does it always find a least-cost solution?
- Time and space complexity are measure in terms of:
	- *b*: maximum branching factor of the search tree
	- *d*: depth of the least-cost solution
	- *m*: maximum depth of the state space (may be infinity)

## Solving Problems by Decomposing Them into Sub-Problems
In addition to using heuristic functions, problems can be solved *using the knowledge about the structure of the problem.*
- Complex problems are addressed by dividing them into _sub-problems_, which are simpler to solve.
- The solution to the main problem is constructed by combining the solutions of the sub-problems into a cohesive plan.
### Problem Decomposition
1. If a problem **P** cannot be solved directly, it is decomposed into smaller sub-problems.
2. Decomposition continues until _basic sub-problems_ (solvable with a single operation) are encountered.
3. The decomposition is represented using an **AND/OR tree**:
    - **Leaves**: Represent trivial sub-problems that are easy to solve.
    - **Intermediate Nodes**: Represent sub-problems derived from combining simpler solutions.
### Features of Problem Decomposition
- Sub-problems are solved starting from the leaves, moving up to the root.
- **AND Nodes**: Require all successors to be solved for the node to be solved.
- **OR Nodes**: Require at least one successor to be solved for the node to be solved.
- Independent sub-problems allow flexibility in solving them in any order.
### Costs in AND/OR Trees
- Relations between sub-problems may have associated costs.
- Total cost of a solution is determined by summing the costs across relevant paths in the tree.
- Optimal solutions minimize the overall cost.
### Solution Representation
- The final solution is a problem-solving plan constructed from the AND/OR tree:
    - The plan includes all subtrees with only AND nodes and trivial leaves.
    - Cost is calculated based on traversing the tree.
![[Pasted image 20250121002051.png]]
## The Hanoi Tower Example
- Demonstrates decomposition:
    1. The main problem is divided into three sub-problems:
        - Moving an (n-1)-disk tower to a spare rod.
        - Moving the nth largest disk to the target rod (trivial sub-problem).
        - Moving the (n-1)-disk tower to the target rod.
    2. Recursive implementation:
        - Each problem is solved by breaking it into smaller sub-problems until trivial moves are reached.
    3. Solution is described using an AND/OR tree with only AND nodes.
### Searching for Optimal Solutions in AND/OR Trees
- If the tree contains OR nodes, multiple solutions are possible.
- **Optimal Solution**: Found by expanding nodes and calculating costs.
    - A node is solved if:
        - It's an OR node and at least one successor is solved.
        - It's an AND node and all successors are solved.
    - Costs help identify the most efficient solution plan.
### Search Strategy for AND/OR Trees
- Strategy involves minimizing the estimated cost of solving the problem:
    - **AO* Algorithm**: A generalization of the A* algorithm for AND/OR trees.
        - For OR nodes, the heuristic combines costs of successors.
        - For AND nodes, the heuristic sums costs of successors.
### Applications of AND/OR Trees
1. Problem-solving by decomposition.
2. Representing knowledge with production rules (e.g., _IF-THEN_ rules).
3. Reasoning:
    - Forward chaining (from facts to conclusions).
    - Backward chaining (from goals to facts).
### Production Rules and AND/OR Trees
- Representation of knowledge:
    - **AND Trees**: All conditions must be met for the conclusion to hold.
    - **OR Trees**: At least one condition suffices for the conclusion.