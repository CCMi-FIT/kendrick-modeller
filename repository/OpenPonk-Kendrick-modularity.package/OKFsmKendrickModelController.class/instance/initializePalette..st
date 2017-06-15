initialization
initializePalette: aPalette
	aPalette addEntry
		label: 'Integrate module';
		icon: OPIcons current dcOmlDiagramIcon;
		action: [ OKFsmIntegrationSelectionDialog openForPalette: aPalette ]