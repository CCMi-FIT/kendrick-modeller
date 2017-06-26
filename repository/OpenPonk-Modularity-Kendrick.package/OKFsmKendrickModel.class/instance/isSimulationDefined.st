testing
isSimulationDefined
	^ additionalCode trim isNotEmpty
		and: [ populationSize > 0
				and: [ simulateStates isNotEmpty and: [ simulationDuration > 0 and: [ simulationStepSize > 0 ] ] ] ]