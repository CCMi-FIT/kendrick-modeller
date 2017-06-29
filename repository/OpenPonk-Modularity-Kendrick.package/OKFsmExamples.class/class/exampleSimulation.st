examples
exampleSimulation
	self
		openExamples:
			{self modelExampleSIR.
			self modelExampleSpecies.
			self modelExampleLinkedSEIRS.
			self modelExampleLinkedSimulation}
		named: 'SIR species with simulation'