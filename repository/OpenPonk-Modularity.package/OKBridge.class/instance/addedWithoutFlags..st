private
addedWithoutFlags: aModel
	"this method adds aModel to the bridge and saves its dependencies"
	definitionModels add: aModel.
	externalModels at: aModel put: Set new.
	resultingModels at: aModel put: Set new.
	self addDependenciesOf: aModel whenChanged: aModel