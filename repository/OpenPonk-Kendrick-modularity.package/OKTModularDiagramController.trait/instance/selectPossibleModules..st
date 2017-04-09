hooks
selectPossibleModules: aDiagramsCollection
	^ (aDiagramsCollection
		reject: [ :eachModel | 
			eachModel == self model
				or: [ self model originalModelObjects includes: eachModel ] ])
		asOrderedCollection