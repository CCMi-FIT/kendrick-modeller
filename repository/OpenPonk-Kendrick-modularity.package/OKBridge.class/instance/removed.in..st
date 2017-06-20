api
removed: anElement in: aDiagramModel
	dirty := true.
	self updateDependenciesOf: aDiagramModel whenChanged: anElement.
	dirty := false