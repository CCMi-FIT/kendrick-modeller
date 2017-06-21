accessing
probability
	^ self isValid
		ifTrue: [ linkedModel probability ]
		ifFalse: [ '' ]