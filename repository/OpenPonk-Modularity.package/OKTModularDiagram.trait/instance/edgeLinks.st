accessing
edgeLinks
	"links to relationships"
	
	^ self elements select: [ :each | each isKindOf: OKModuleRelationshipLink ]