removing
removeModel: aModel
	super removeModel: aModel.
	self updateResultsForRemoved: aModel.
	resultModels removeAt: aModel