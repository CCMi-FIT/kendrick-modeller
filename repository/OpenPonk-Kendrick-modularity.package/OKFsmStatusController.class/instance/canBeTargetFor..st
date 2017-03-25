testing
canBeTargetFor: aController
	^ aController modelClass == OPFsmTransition
		or: [ aController modelClass == OKFsmInfluence ]