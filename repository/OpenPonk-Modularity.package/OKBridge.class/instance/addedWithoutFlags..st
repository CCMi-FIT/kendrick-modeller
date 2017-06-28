private
addedWithoutFlags: aDefinitionModel
	"this method adds aDefinitionModel to the bridge and saves its dependencies"

	definitionModels add: aDefinitionModel.
	externalModels at: aDefinitionModel put: Set new.
	resultingModels at: aDefinitionModel put: Set new.
	self
		addDependenciesOf: aDefinitionModel;
		updateLinksIn: aDefinitionModel thenForceAnnounce: true