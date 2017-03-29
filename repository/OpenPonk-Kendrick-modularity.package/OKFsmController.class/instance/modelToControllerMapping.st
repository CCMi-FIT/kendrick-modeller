accessing
modelToControllerMapping
	^ Dictionary new
		at: OKFsmPatch put: OKFsmPatchController;
		at: OKFsmSpecies put: OKFsmSpeciesController;
		at: OKFsmStatus put: OKFsmStatusController;
		at: OPFsmTransition put: OPFsmTransitionController;
		at: OKFsmInfluence put: OKFsmInfluenceController;
		at: OKFsm put: OKFsmModuleController;
		yourself