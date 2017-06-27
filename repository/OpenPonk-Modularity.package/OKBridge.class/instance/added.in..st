api
added: anElement in: aDiagramModel
	"call this if anElement has been added to aDiagramModel, which is a definition model"
	self addDependenciesOf: aDiagramModel whenChanged: anElement