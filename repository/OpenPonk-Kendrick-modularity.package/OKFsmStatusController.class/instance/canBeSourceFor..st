testing
canBeSourceFor: aController
	^ aController modelClass == OPFsmTransition
		or: [ aController modelClass == OKFsmInfluence ]