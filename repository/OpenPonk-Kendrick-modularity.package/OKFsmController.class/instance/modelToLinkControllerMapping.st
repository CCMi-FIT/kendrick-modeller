accessing
modelToLinkControllerMapping
	^ Dictionary new
		at: OKFsmComposition put: OKFsmModuleController;
		at: OKFsmKendrickModel put: OKFsmModuleController;
		yourself