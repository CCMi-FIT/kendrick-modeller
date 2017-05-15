import
edgeForType: aType
	^ ({(#transition -> OKFsmTransition).
	(#influence -> OKFsmInfluence)} asDictionary at: aType) new