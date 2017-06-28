private
updateResultDiagrams
	| transformedModels |
	transformedModels := bridge resultingModels.
	resultingModels := models flatCollect: [ :each | transformedModels at: each ].
	self announceUpdated