hooks
selectPossibleModules
	^ (self project models
		reject:
			[ :eachModel | eachModel == self model or: [ self model originalModelObjects includes: eachModel ] ])
		asOrderedCollection