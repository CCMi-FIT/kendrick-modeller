initialization
initializePalette: aPalette
	aPalette
		newCreationTool: 'Status'
			factory: [ OKFsmStatusController new ]
			icon: OPIcons current dcFsmRegularStateIcon;
		newCreationTool: 'Empty status'
			factory: [ OKFsmEmptyStatusController new ]
			icon: OPIcons current dcFsmRegularStateIcon;
		newCreationTool: 'Species'
			factory: [ OKFsmSpeciesController new ]
			icon: OPIcons current dcFsmFinalStateIcon;
		"newCreationTool: 'Patch' factory: [ OKFsmPatchController new ] icon: OPIcons current dcFsmFinalStateIcon;"
			newSeparator;
		newConnectionCreationTool: 'Transition'
			factory: [ OKFsmTransitionController new ]
			icon: OPIcons current dcFsmTransitionIcon;
		newSeparator.
	aPalette addEntry
		label: 'Extend concern';
		icon: OPIcons current dcOmlDiagramIcon;
		action: [ OKFsmDependanceSelectionDialog openForPalette: aPalette ].
	aPalette addEntry
		label: 'Link to concern element';
		icon: OPIcons current dcOmlBoxIcon;
		action: [ OKFsmElementSelectionDialog openForPalette: aPalette ]