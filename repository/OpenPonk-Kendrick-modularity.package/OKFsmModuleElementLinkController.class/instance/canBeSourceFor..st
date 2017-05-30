testing
canBeSourceFor: aController
	^ (aController isKindOf: OKFsmTransitionController)
		or: [ aController isKindOf: OKModuleRelationshipLinkController ]