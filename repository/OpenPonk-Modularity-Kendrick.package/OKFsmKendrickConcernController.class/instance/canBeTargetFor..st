testing
canBeTargetFor: aController
	^ (aController isKindOf: OPFsmVertexController)
		or: [ (aController isKindOf: OKModuleElementLinkController)
				or: [ super canBeTargetFor: aController ] ]