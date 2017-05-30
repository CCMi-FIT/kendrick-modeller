api
added: anElement in: aDiagramModel
	dirty := true.
	self addDependenciesOf: aDiagramModel.
	dirty := false