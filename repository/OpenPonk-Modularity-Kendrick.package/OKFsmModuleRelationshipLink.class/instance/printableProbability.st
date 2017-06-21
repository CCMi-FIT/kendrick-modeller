accessing
printableProbability
	^ self isValid
		ifTrue: [ linkedModel printableProbability ]
		ifFalse: [ '' ]