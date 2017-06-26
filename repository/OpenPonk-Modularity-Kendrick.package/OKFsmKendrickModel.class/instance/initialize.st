initialization
initialize
	super initialize.
	views := OrderedCollection new.
	populationSize := 0.
	simulateStates := OrderedCollection new.
	simulationDuration := 0.
	simulationStepSize := 0.