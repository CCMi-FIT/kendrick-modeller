initialization
addModuleButtonToPalette: aPalette
	aPalette addItem
		label: 'Module';
		icon: OPIcons current dcOmlDiagramIcon;
		action: [ OKModuleSelectionDialog openForPalette: aPalette ]