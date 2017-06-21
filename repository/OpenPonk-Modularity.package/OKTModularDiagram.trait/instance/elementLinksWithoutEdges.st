accessing
elementLinksWithoutEdges
	^ self elements select: [ :each | each isKindOf: OKModuleElementLink ]