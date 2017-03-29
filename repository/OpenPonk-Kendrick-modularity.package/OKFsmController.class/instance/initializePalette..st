initialization
initializePalette: aPalette
	| moduleButton |
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
			icon: OPIcons current dcFsmTransitionIcon;
		newSeparator.
	moduleButton := aPalette addItem.
	moduleButton
		label: 'Module';
		icon: OPIcons current dcOmlDiagramIcon;
		action: [ OKModuleSelectionDialog
				openForWorkbench: aPalette workbench
				diagramController: aPalette diagramController ]