accessing
dependingOnElements
	"elements that have to be created before I am"

	^ super dependingOnElements
		add: self source;
		add: self target;
		yourself