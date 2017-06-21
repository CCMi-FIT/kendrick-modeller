initialization
initialize
	dirty := true.
	super initialize.
	originalModels := OrderedCollection new.
	externalModels := Dictionary new.
	transformedModels := Dictionary new.
	dependingModels := Dictionary new.
	dirty := false