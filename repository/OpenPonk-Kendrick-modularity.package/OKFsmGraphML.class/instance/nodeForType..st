import
nodeForType: aType
	^ ({(#patch -> OKFsmPatch).
	(#species -> OKFsmSpecies).
	(#status -> OKFsmStatus).
	(#emptyStatus -> OKFsmEmptyStatus)} asDictionary at: aType) new