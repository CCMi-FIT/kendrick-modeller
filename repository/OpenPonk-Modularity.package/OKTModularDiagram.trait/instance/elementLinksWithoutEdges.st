accessing
elementLinksWithoutEdges
	"links to elements, excluding relationships"
	
	^ self elements select: [ :each | each isKindOf: OKModuleElementLink ]