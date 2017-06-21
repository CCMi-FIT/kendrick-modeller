api
added: anElement in: aDiagramModel
	dirty := true.
	self addDependenciesOf: aDiagramModel whenChanged: anElement.
	dirty := false