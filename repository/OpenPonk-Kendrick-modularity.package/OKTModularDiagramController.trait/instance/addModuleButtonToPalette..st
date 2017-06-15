initialization
addModuleButtonToPalette: aPalette
	aPalette addEntry
		label: 'Module';
		icon: OPIcons current dcOmlDiagramIcon;
		action: [ OKModuleSelectionDialog openForPalette: aPalette ]