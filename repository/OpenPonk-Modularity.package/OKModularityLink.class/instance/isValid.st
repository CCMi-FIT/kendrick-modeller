testing
isValid
	"do I point to an model object that can be validly linked to? if not, no result should be produces out of a model I am part of"

	^ linkedModel isNotNil and: [ linkedModel canBeValidLinkedTo ]