initialization
initializePalette: aPalette
	aPalette addItem
		label: 'Concern';
		icon: OPIcons current dcOmlDiagramIcon;
		action: [ OKFsmConcernSelectionDialog openForPalette: aPalette ].
	aPalette addItem
		label: 'Backend model';
		icon: OPIcons current dcOmlDiagramIcon;
		action: [ OKFsmBackendModelSelectionDialog openForPalette: aPalette ]