accessing
elementAndEdgeLinks
	^ self elements select: [ :each | each isKindOf: OKModulePartLink ]