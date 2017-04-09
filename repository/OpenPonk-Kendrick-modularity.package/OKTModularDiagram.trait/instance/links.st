accessing
links
	^ self elements select: [ :each | each isKindOf: OKModularityLink ]