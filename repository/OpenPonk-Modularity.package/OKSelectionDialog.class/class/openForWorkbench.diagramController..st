instance creation
openForWorkbench: aWorkbench diagramController: aDiagramController
	^ self new
		workbench: aWorkbench diagramController: aDiagramController;
		openWithSpec