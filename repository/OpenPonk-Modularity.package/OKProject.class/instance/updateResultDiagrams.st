private
updateResultDiagrams
	| transformedModels |
	transformedModels := bridge transformedModels.
	resultModels := models flatCollect: [ :each | transformedModels at: each ].
	self announceUpdated