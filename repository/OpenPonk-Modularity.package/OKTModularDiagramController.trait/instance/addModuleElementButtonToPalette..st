initialization
addModuleElementButtonToPalette: aPalette
	aPalette addEntry
		label: 'Element from module';
		icon: OPIcons current dcOmlBoxIcon;
		action: [ aPalette deselectTool.
			OKModuleElementSelectionDialog
				openForWorkbench: aPalette workbench
				diagramController: aPalette diagramController ]