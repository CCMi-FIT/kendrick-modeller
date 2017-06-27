api
removed: anElement in: aDiagramModel
	"call this if anElement has been removed from aDiagramModel, which is a definition model"

	self updateDependenciesOf: aDiagramModel whenChanged: anElement