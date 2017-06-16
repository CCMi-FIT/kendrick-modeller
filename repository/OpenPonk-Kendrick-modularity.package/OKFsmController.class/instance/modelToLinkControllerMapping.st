accessing
modelToLinkControllerMapping
	^ Dictionary new
		at: OKFsmKendrickModel put: OKFsmModuleController;
		at: OKFsmKendrickConcern put: OKFsmModuleController;
		at: OKFsmTransition put: OKFsmModuleRelationshipLinkController;
		at: OKFsmInfluence put: OKFsmModuleRelationshipLinkController;
		at: OKFsmCompartment put: OKFsmModuleElementLinkController;
		at: OKFsmSpecies put: OKFsmModuleElementLinkController;
		at: OKFsmStatus put: OKFsmModuleElementLinkController;
		at: OKFsmEmptyStatus put: OKFsmModuleElementLinkController;
		yourself