testing
canBeSourceFor: aController
	^ (aController isKindOf: OKFsmInfluenceController)
		or: [ aController isKindOf: OKModuleRelationshipLinkController ]