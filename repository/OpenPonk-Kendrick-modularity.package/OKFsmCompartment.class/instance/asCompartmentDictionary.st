accessing
asCompartmentDictionary
	^ Dictionary new , (parts collect: [ :each | each asCompartmentDictionary ])