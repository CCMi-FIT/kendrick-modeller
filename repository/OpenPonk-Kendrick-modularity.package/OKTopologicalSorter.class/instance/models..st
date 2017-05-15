api
models: models
	sortedModels := OrderedCollection new.
	temporarilyMarkedNodes := OrderedCollection new.
	unmarkedNodes := OrderedCollection newFrom: models