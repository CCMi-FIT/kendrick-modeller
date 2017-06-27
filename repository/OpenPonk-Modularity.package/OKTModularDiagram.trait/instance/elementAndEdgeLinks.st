accessing
elementAndEdgeLinks
	"links to elements, including relationships"
	
	^ self elements select: [ :each | each isKindOf: OKModulePartLink ]