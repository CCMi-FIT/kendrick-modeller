updating
updateResultDiagrams
	| newResultModels transformedModels |
	newResultModels := OrderedCollection new.
	transformedModels := bridge transformedModels.
	models do: [ :each | newResultModels addAll: (transformedModels at: each) ].
	resultModels := newResultModels.
	self announceUpdated