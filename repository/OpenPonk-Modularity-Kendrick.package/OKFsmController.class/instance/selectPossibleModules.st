hooks
selectPossibleModules
	"return all linkable resulting models that are not already linked -- note that this condition should be removed for hierarchial models, where a single model can be linked multiple times"
	
	^ (self project resultingModels
		reject: [ :eachModel | 
			eachModel name == self model name
				or: [ eachModel canBeValidLinkedTo not
						or: [ self model originalModelObjects includes: eachModel ] ] ]) asOrderedCollection