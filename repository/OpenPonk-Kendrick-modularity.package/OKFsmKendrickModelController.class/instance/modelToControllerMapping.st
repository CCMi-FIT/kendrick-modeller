accessing
modelToControllerMapping
	^ Dictionary new
		at: OKFsmPatch put: OKFsmPatchController;
		at: OKFsmSpecies put: OKFsmSpeciesController;
		at: OKFsmStatus put: OKFsmStatusController;
		at: OKFsmEmptyStatus put: OKFsmEmptyStatusController;
		at: OKFsmTransition put: OKFsmTransitionController;
		at: OKFsmInfluence put: OKFsmInfluenceController;
		at: OKFsmModule put: OKFsmModuleController;
		at: OKFsmBackendModule put: OKFsmBackendModuleController;
		at: OKFsmModuleRelationshipLink put: OKFsmModuleRelationshipLinkController;
		at: OKFsmModuleElementLink put: OKFsmModuleElementLinkController;
		yourself