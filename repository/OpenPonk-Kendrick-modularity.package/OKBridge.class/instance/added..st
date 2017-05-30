api
added: aModel
	dirty := true.
	originalModels add: aModel.
	externalModels at: aModel put: Set new.
	transformedModels at: aModel put: Set new.
	self addDependenciesOf: aModel.
	dirty := false