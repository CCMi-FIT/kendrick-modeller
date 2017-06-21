testing
hasResultDiagram: aDiagram
	^ resultControllers anySatisfy: [ :each | each model = aDiagram ]