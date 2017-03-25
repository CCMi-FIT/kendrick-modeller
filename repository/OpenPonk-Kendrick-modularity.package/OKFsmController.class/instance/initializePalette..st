initialization
initializePalette: aPalette
	aPalette
		newCreationTool: 'Status'
			factory: [ OKFsmStatusController new ]
			icon: OPIcons current dcFsmRegularStateIcon;
		newCreationTool: 'Species'
			factory: [ OKFsmSpeciesController new ]
			icon: OPIcons current dcFsmFinalStateIcon;
		newCreationTool: 'Patch'
			factory: [ OKFsmPatchController new ]
			icon: OPIcons current dcFsmFinalStateIcon;
		newSeparator;
		newConnectionCreationTool: 'Transition'
			factory: [ OPFsmTransitionController new ]
			icon: OPIcons current dcFsmTransitionIcon;
		newConnectionCreationTool: 'Species Influence'
			factory: [ OKFsmInfluenceController new ]
			icon: OPIcons current dcFsmTransitionIcon