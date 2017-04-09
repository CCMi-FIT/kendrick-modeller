testing
canBeTargetFor: aController
	^ (aController modelClass isKindOf: OKFsmTransition)
		or: [ aController isKindOf: OKModuleRelationshipLinkController ]