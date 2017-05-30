hooks
selectPossibleModules
	^ (self project models
		reject: [ :eachModel | 
			eachModel == self model
				or: [ eachModel canBeValidLinkedTo not
						or: [ self model originalModelObjects includes: eachModel ] ] ]) asOrderedCollection