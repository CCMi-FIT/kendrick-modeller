testing
canBeValidLinkedTo
	^ self source canBeValidLinkedTo and: [ self target canBeValidLinkedTo ]