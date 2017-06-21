private
addedWithoutFlags: aModel
	originalModels add: aModel.
	externalModels at: aModel put: Set new.
	transformedModels at: aModel put: Set new.
	self addDependenciesOf: aModel whenChanged: aModel