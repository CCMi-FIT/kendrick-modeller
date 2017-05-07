initialization
initializePalette: aPalette
	aPalette
		newCreationTool: 'Status'
			factory: [ OKFsmStatusController new ]
			icon: OPIcons current dcFsmRegularStateIcon;
		newCreationTool: 'Empty status'
			factory: [ OKFsmEmptyStatusController new ]
			icon: OPIcons current dcFsmInitialStateIcon;
		newCreationTool: 'Species'
			factory: [ OKFsmSpeciesController new ]
			icon: OPIcons current dcFsmFinalStateIcon;
		"newCreationTool: 'Patch'
			factory: [ OKFsmPatchController new ]
			icon: OPIcons current dcFsmFinalStateIcon;"
			newSeparator;
		newConnectionCreationTool: 'Transition'
			factory: [ OKFsmTransitionController new ]
			icon: OPIcons current dcFsmTransitionIcon;
		newConnectionCreationTool: 'Species Influence'
			factory: [ OKFsmInfluenceController new ]
			icon: OPIcons current dcFsmTransitionIcon;
		newSeparator.
	aPalette addItem
		label: 'Extended model';
		icon: OPIcons current dcOmlDiagramIcon;
		action: [ OKFsmBackendModelSelectionDialog openForPalette: aPalette ].
	aPalette addItem
		label: 'Element from module';
		icon: OPIcons current dcOmlBoxIcon;
		action: [ OKModuleElementSelectionDialog openForPalette: aPalette ]