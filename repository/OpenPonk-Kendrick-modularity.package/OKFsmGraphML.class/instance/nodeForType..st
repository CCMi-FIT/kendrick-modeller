import
nodeForType: aType
	^ ({(#status -> OKFsmStatus).
	(#emptyStatus -> OKFsmEmptyStatus).
	(#species -> OKFsmSpecies).
	(#compartment -> OKFsmCompartment)} asDictionary at: aType) new