testing
canBeValidLinkedTo
	"if a link is created to point to me, should the link be considered valid? it is if the same applies for my source and target"
	
	^ self source canBeValidLinkedTo and: [ self target canBeValidLinkedTo ]