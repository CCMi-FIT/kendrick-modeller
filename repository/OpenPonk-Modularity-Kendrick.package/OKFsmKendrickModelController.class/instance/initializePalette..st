initialization
initializePalette: aPalette
	aPalette addEntry
		label: 'Integrate concern';
		icon: OPIcons current dcOmlDiagramIcon;
		action: [ OKFsmIntegrationSelectionDialog openForPalette: aPalette ]