examples
modelExampleLinkedSimulation
	| model sir spec |
	model := OKFsmKendrickModel named: 'SIR with species'.
	sir := OKFsmModuleLink toName: 'SIR'.
	spec := OKFsmModuleLink toName: 'Species'.
	model
		addAll:
			{sir.
			spec}.
	model
		populationSize: 13000;
		simulationDuration: 0.5;
		simulationStepSize: 0.002;
		additionalCode: OKFsmAdditionalCodeEditor exampleCode;
		parseSimulateStates: 'I'.
	^ model