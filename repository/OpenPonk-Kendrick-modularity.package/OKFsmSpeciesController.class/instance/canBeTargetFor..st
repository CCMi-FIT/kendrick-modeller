testing
canBeTargetFor: aController
	^ (aController modelClass isKindOf: OKFsmInfluence)
		or: [ aController isKindOf: OKModuleRelationshipLinkController ]