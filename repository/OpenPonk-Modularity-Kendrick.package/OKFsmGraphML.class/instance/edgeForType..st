import
edgeForType: aType
	^ ({(#transition -> OKFsmTransition)} asDictionary at: aType) new