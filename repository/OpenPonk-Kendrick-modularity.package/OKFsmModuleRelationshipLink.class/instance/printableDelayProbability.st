accessing
printableDelayProbability
	^ (NumberParser isNumber: delayProbability)
		ifTrue: [ delayProbability ]
		ifFalse: [ delayProbability asSymbol storeString ]