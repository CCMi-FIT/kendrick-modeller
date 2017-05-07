accessing
modelToControllerMapping
	^ Dictionary new
		at: OKFsmModule put: OKFsmModuleController;
		at: OKFsmBackendModule put: OKFsmBackendModuleController;
		yourself