accessing
workbench: aWorkbench diagramController: aDiagramController
	| models |
	workbench := aWorkbench.
	diagramController := aDiagramController.
	models := self models.
	list
		items: (models collect: [ :each | each asString ]);
		whenSelectionIndexChanged: [ :selectedIndex | 
			self
				selected: (models at: selectedIndex);
				delete ]