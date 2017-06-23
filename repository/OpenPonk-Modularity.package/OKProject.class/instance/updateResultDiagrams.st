private
updateResultDiagrams
	| transformedModels |
	transformedModels := bridge resultingModels.
	resultModels := models flatCollect: [ :each | transformedModels at: each ].
	self announceUpdated