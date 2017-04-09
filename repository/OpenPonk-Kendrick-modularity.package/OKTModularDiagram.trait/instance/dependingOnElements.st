accessing
dependingOnElements
	^ self owner ifNotNil: [ Set with: self owner ] ifNil: [ Set new ]