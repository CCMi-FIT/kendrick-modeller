testing
canBeTargetFor: aController
	^ (aController isKindOf: OPFsmVertexController)
		or: [ aController isKindOf: OKFsmModuleController ]