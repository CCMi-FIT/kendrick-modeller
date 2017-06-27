accessing
dependingElements
	"elements that cannot be created until I am"

	^ (self ownedElements , self relatedElements) asSet