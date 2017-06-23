initialization
initialize
	dirty := true.
	super initialize.
	definitionModels := OrderedCollection new.
	externalModels := Dictionary new.
	resultingModels := Dictionary new.
	dependingModels := Dictionary new.
	dirty := false