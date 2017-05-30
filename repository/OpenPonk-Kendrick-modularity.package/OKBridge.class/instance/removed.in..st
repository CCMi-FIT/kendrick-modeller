api
removed: anElement in: aDiagramModel
	dirty := true.
	self updateDependenciesOf: aDiagramModel.
	dirty := false