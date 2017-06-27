accessing
dependingOnElements
	"elements that have to be created before I am"

	^ self owner ifNotNil: [ Set with: self owner ] ifNil: [ Set new ]