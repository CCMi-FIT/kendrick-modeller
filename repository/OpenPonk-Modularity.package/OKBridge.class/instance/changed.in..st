api
changed: aModelOrItsElement in: aDefinitionModel
	"call this if aModelOrItsElement has been changed in aDiagramModel -- note that if the change was in the model itself, aModelOrItsElement and aDiagramModel should be the same object"

	self update: aDefinitionModel whenChanged: aModelOrItsElement