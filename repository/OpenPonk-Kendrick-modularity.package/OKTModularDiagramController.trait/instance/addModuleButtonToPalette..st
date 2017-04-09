initialization
addModuleButtonToPalette: aPalette
	aPalette addItem
		label: 'Module';
		icon: OPIcons current dcOmlDiagramIcon;
		action: [ aPalette deselectTool.
			OKModuleSelectionDialog
				openForWorkbench: aPalette workbench
				diagramController: aPalette diagramController ]