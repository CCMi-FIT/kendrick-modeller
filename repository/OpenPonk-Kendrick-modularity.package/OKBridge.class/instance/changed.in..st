api
changed: anElement in: aDiagramModel
	dirty := true.
	self updateDependenciesOf: aDiagramModel.
	dirty := false