initialization
initialize
	super initialize.
	resultModels := Dictionary new.
	bridge := self bridgeClass project: self