# 1. Training machine learning algorithms using weka GUI explorer

The J48 classifier in Weka is an implementation of the C4.5 algorithm for decision tree generation. Here’s a summary of each parameter and its function:

- **batchSize**: Determines the number of instances processed in a single batch. A larger batch size may use more memory but can speed up training.

- **binarySplits**: If set to `True`, the classifier will split attributes with more than two values into binary splits instead of multi-way splits. This can simplify the tree structure but may increase its depth.

- **collapseTree**: If `True`, the tree will be collapsed (pruned) to remove unnecessary nodes after it is fully generated. Collapsing can make the tree smaller and less complex.

- **confidenceFactor**: This is the confidence level used in pruning. A lower value results in more pruning, making the tree smaller and potentially reducing overfitting, while a higher value allows a larger tree that may capture more complexity.

- **debug**: If enabled (`True`), additional debugging information will be printed during the tree's generation, useful for diagnosing issues or understanding the process in more detail.

- **doNotCheckCapabilities**: Normally, Weka checks whether the data and classifier are compatible (e.g., appropriate data types). Setting this to `True` skips these checks, which may speed up processing but can lead to errors if the data is incompatible.

- **doNotMakeSplitPointActualValue**: If set to `True`, the classifier will not necessarily split at the actual data values, which might result in less precise splits but can improve performance on large datasets.

- **minNumObj**: The minimum number of instances required at a leaf node for it to be split. A higher value will lead to fewer splits and thus a simpler tree. Setting this to 1 would mean every instance could potentially be a unique branch.

- **numDecimalPlaces**: Specifies the number of decimal places used in outputting the numeric values in the tree. It doesn’t affect the model but controls output precision.

- **numFolds**: If `reducedErrorPruning` is set to `True`, this specifies the number of folds used in reduced-error pruning. Higher values lead to more accurate pruning but increase computation time.

- **reducedErrorPruning**: If enabled (`True`), reduced-error pruning will be used, which typically requires a separate validation dataset. This helps in reducing overfitting.

- **saveInstanceData**: If set to `True`, the instance data will be saved, which can be useful for analysis but uses more memory.

- **seed**: Random seed for reproducibility. It affects the randomness used in processes like reduced-error pruning (if enabled) or random attribute selection.

- **subtreeRaising**: If `True`, subtree raising will be performed during pruning, which can potentially result in a smaller tree by moving subtrees up to higher levels.

- **unpruned**: If `True`, the tree will not be pruned at all, which often results in a larger tree that may overfit to the training data. Setting this to `False` allows pruning to make a more generalized model.

- **useLaplace**: If `True`, Laplace smoothing will be used for probability estimates, which can help if there are many nodes with few instances.

- **useMDLcorrection**: If enabled (`True`), the Minimum Description Length (MDL) principle will be applied to penalize complex models, leading to a simpler tree with potentially fewer branches.

These parameters offer control over the complexity, pruning, and performance of the decision tree model in Weka, allowing users to tailor the classifier to their specific data and objectives.

## How do the 2 algorithms work?
1. __J48 Tree classifier__
	- Algoritem izracuna entropijo (kolicino informacije) za vsak atribut, da ugotovi kateri izmed njih najbolje razdeli podatke na zeljene razrede. Nato izracuna zacetno entropijo, ki predstavlja entropijo celotnega nabora podatkov, nato pa se entropijo ko uporabimo vsak posamezen atribut za delitev nabora podatkov. Tisti atribut, ki v tem procesu prikaze najvecje zmanjsanje entropije (najvecja informacijska pridobitev) postane najnizji clen drevesa
	- Na bazi prvega atributa se podatki razdelijo in zacnejo ustvarjati poddrevesa, kjer rekurzivno izbere naslednje najbolj informativne atribute za vsako vejo dokler ne doseze zadnjega vozlisca, ki predstavlja koncni razred klasifikacije
	- Ko razvito drevo uporabljamo za klasifikacijo testnega ali kateregakoli drugega nabora podatkov se podatki primerjajo z atributom doticnega vozlisca, dokler ne doseze zadnjega vozlisca, ki predstavlja koncni razred klasifikacije podatka
2. __Multilayer perceptron__
	- Vecplastni perceptron vsebuje:
		- Vhodno plast, katere velikost je enaka stevilu atributov podatkov.
		- Skrite plasti, kjer se med atributi delajo nelinearne relacije, ki pomagajo mrezi "razumeti" kompleksne relacije med razlicnimi atributi vhodnih podatkov, ki ji pomagajo razvrstiti podatke v izhodne razrede
		- Izhodno plast, ki prejme utezene povezave med atributi iz skritih plasti. Vsak izhodni nevron je povezan z vsemi nevroni iz zadnje skrite plasti. Glede na utezenost signala iz posameznega nevrona nato izhodna plast izracuna verjetnosti pripadanja posameznemu izhodnemu razredu in ta vhod klasificira v enega izmed izhodnih razredov
