accessing
printableProbability
	| tempName |
	tempName := self name.
	^ (NumberParser isNumber: tempName)
		ifTrue: [ tempName ]
		ifFalse: [ tempName asSymbol storeString ]