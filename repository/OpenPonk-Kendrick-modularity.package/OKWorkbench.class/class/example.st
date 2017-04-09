example
example
	| project |
	project := OPProject named: 'SIR species example'.
	project
		addModel: OKFsmExamples modelExampleSIR;
		addModel: OKFsmExamples modelExampleSpecies;
		addModel: OKFsmExamples modelExampleSpeciesSIR;
		addModel: OKFsmExamples modelExampleEmptyKendrickModel;
		addModel: OKFsmExamples modelExampleEmptyComposition.
	self openProject: project