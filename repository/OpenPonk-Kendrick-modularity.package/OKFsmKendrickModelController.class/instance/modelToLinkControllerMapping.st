accessing
modelToLinkControllerMapping
	^ super modelToLinkControllerMapping
		at: OKFsmTransition put: OKFsmModuleRelationshipLinkController;
		at: OKFsmInfluence put: OKFsmModuleRelationshipLinkController;
		at: OKFsmPatch put: OKFsmModuleElementLinkController;
		at: OKFsmSpecies put: OKFsmModuleElementLinkController;
		at: OKFsmStatus put: OKFsmModuleElementLinkController;
		at: OKFsmEmptyStatus put: OKFsmModuleElementLinkController;
		yourself