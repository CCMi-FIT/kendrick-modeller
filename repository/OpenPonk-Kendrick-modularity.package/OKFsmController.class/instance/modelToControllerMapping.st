accessing
modelToControllerMapping
	^ super modelToControllerMapping
		at: OKFsmInfluence put: OKFsmInfluenceController;
		yourself