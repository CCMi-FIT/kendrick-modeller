testing
canBeLinkedTo
	"is it even possible to create a link to me? it is if my source and target can be linked to"
	
	^ self source canBeLinkedTo and: [ self target canBeLinkedTo ]