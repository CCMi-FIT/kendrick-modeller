initialization
initialize
	super initialize.
	resultingModels := OrderedCollection new.
	bridge := self bridgeClass project: self