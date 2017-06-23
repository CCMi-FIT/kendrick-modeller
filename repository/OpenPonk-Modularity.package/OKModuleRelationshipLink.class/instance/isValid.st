testing
isValid
	^ source canBeValidLinkedTo
		and: [ target canBeValidLinkedTo and: [ super isValid ] ]