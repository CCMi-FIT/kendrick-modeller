hooks
selectPossibleModules
	^ (self project resultModels
		reject: [ :eachModel | 
			eachModel name == self model name
				or: [ eachModel canBeValidLinkedTo not
						or: [ self model originalModelObjects includes: eachModel ] ] ]) asOrderedCollection