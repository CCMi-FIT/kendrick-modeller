private
addedWithoutFlags: aModel
	definitionModels add: aModel.
	externalModels at: aModel put: Set new.
	resultingModels at: aModel put: Set new.
	self addDependenciesOf: aModel whenChanged: aModel