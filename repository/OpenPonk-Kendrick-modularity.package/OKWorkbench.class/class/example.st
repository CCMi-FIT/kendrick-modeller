example
example
	| project |
	project := OPProject named: 'SIR species mockup'.
	project
		addModel: OKFsmExamples modelExampleSIR;
		addModel: OKFsmExamples modelExampleSpecies;
		addModel: OKFsmExamples modelExampleSpeciesSIR.
	self openProject: project