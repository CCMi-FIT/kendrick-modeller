accessing
elementLinks
	^ self elements select: [ :each | each isKindOf: OKModuleElementLink ]