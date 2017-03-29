accessing
workbench: aWorkbench diagramController: aDiagramController
	| modules |
	workbench := aWorkbench.
	diagramController := aDiagramController.
	modules := (self project models
		reject: [ :eachModel | 
			eachModel == diagramController model
				or: [ diagramController model elements includes: eachModel ] ]
		thenCollect: [ :eachModel | eachModel name -> eachModel ]) asDictionary.
	list items: modules keys.
	list
		whenSelectedItemChanged: [ :selectedName | 
			| model |
			model := modules at: selectedName.
			diagramController
				addAsTargetFor:
					((diagramController controllerNameFor: model) new
						model: model;
						yourself).
			self delete ]