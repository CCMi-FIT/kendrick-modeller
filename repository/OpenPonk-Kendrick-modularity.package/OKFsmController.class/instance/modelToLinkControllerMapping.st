accessing
modelToLinkControllerMapping
	^ Dictionary new
		at: OKFsmKendrickModel put: OKFsmModuleController;
		at: OKFsmKendrickConcern put: OKFsmModuleController;
		yourself