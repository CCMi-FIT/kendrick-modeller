removing
removeModel: aModel
	super removeModel: aModel.
	self updateResultsForRemoved: aModel.
	resultingModels removeAt: aModel