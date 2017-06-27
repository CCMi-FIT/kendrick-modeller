accessing
modelToControllerMapping
	^ Dictionary new
		at: OKFsmCompartment put: OKFsmCompartmentController;
		at: OKFsmSpecies put: OKFsmSpeciesController;
		at: OKFsmStatus put: OKFsmStatusController;
		at: OKFsmEmptyStatus put: OKFsmEmptyStatusController;
		at: OKFsmTransition put: OKFsmTransitionController;
		at: OKFsmModuleLink put: OKFsmModuleController;
		at: OKFsmModuleRelationshipLink put: OKFsmModuleRelationshipLinkController;
		at: OKFsmModuleElementLink put: OKFsmModuleElementLinkController;
		yourself