initialization
initialize
	super initialize.
	resultModels := OrderedCollection new.
	bridge := self bridgeClass project: self