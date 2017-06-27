instance creation
openForPalette: aPalette
	aPalette deselectTool.
	^ self openForWorkbench: aPalette workbench diagramController: aPalette diagramController