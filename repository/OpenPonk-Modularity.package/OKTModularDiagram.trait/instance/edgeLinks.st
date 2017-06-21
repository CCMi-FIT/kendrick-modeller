accessing
edgeLinks
	^ self elements select: [ :each | each isKindOf: OKModuleRelationshipLink ]