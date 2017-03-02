as yet unclassified
modelToControllerMapping
	^ super modelToControllerMapping
		at: OKFsmInfluence put: OKFsmInfluenceController;
		yourself