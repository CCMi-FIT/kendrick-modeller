instance creation
openForPalette: aPalette
	aPalette deselectTool.
	^ self new
		workbench: aPalette workbench diagramController: aPalette diagramController;
		openWithSpec