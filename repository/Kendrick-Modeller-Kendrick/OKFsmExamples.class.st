Class {
	#name : #OKFsmExamples,
	#superclass : #Object,
	#category : #'Kendrick-Modeller-Kendrick-Examples'
}

{ #category : #examples }
OKFsmExamples class >> example [
	self
		openExamples:
			{self modelExampleSIR.
			self modelExampleSpecies.
			self modelExampleEmptyConcern.
			self modelExampleEmptyModel}
		named: 'SIR species example'
]

{ #category : #examples }
OKFsmExamples class >> exampleEmpty [
	self openExamples: {} named: 'New Kendrick project'
]

{ #category : #examples }
OKFsmExamples class >> exampleEmptyConcern [
	self openExamples: {self modelExampleEmptyConcern}
]

{ #category : #examples }
OKFsmExamples class >> exampleEmptyModel [
	self openExamples: {self modelExampleEmptyModel}
]

{ #category : #examples }
OKFsmExamples class >> exampleSIR [
	self openExamples: {self modelExampleSIR}
]

{ #category : #examples }
OKFsmExamples class >> exampleSimulation [
	self
		openExamples:
			{self modelExampleSIR.
			self modelExampleSpecies.
			self modelExampleLinkedSEIRS.
			self modelExampleLinkedSimulation}
		named: 'SIR species with simulation'
]

{ #category : #examples }
OKFsmExamples class >> exampleSpecies [
	self openExamples: {self modelExampleSpecies}
]

{ #category : #examples }
OKFsmExamples class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'OpenPonk-Modularity-Kendrick examples')
		icon: OPIcons current dynacaseIcon;
		action: [ self exampleEmpty ];
		with: [ (aBuilder item: #'Empty concern')
				icon: OPIcons current dynacaseIcon;
				parent: #'OpenPonk-Modularity-Kendrick examples';
				action: [ self exampleEmptyConcern ].
			(aBuilder item: #'Empty model')
				icon: OPIcons current dynacaseIcon;
				parent: #'OpenPonk-Modularity-Kendrick examples';
				action: [ self exampleEmptyModel ].
			(aBuilder item: #'Unused SIR and species concerns')
				icon: OPIcons current dynacaseIcon;
				parent: #'OpenPonk-Modularity-Kendrick examples';
				action: [ self example ].
			(aBuilder item: #'SIR and species simulation')
				icon: OPIcons current dynacaseIcon;
				parent: #'OpenPonk-Modularity-Kendrick examples';
				action: [ self exampleSimulation ] ]
]

{ #category : #examples }
OKFsmExamples class >> modelExampleEmptyConcern [
	^ OKFsmKendrickConcern named: 'new Kendrick concern'
]

{ #category : #examples }
OKFsmExamples class >> modelExampleEmptyModel [
	^ OKFsmKendrickModel named: 'new Kendrick model'
]

{ #category : #examples }
OKFsmExamples class >> modelExampleLinkedSEIRS [
	| model m s i r si ir rs |
	model := OKFsmKendrickConcern named: 'SEIRS'.
	m := OKFsmModuleLink toName: 'SIR'.
	s := OKFsmModuleElementLink toName: 'S'.
	i := OKFsmModuleElementLink toName: 'I'.
	r := OKFsmModuleElementLink toName: 'R'.
	si := OKFsmModuleRelationshipLink from: s to: i.
	ir := OKFsmModuleRelationshipLink from: i to: r.
	rs := OKFsmTransition from: r to: s probabilityParameter: 'nu'.
	si
		delayProbability: 'sigma';
		delayStateName: 'E'.
	model
		addAll:
			{m.
			s.
			i.
			r.
			si.
			ir.
			rs}.
	^ model
]

{ #category : #examples }
OKFsmExamples class >> modelExampleLinkedSimulation [
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
]

{ #category : #examples }
OKFsmExamples class >> modelExampleSIR [
	| model s i r e |
	model := OKFsmKendrickConcern named: 'SIR'.
	s := OKFsmStatus named: 'S'.
	i := OKFsmStatus named: 'I'.
	r := OKFsmStatus named: 'R'.
	e := OKFsmEmptyStatus new.
	model
		add: s;
		add: i;
		add: r;
		add: e.
	model
		addAll:
			{(s -> i name: 'lambda').
			(i -> r name: 'gamma').
			(s -> e name: 'mu').
			(i -> e name: 'mu').
			(r -> e name: 'mu').
			(e -> s name: 'mu')}.
	^ model
]

{ #category : #examples }
OKFsmExamples class >> modelExampleSpecies [
	| model reservoir1 reservoir2 mosquito |
	model := OKFsmKendrickConcern named: 'Species'.
	reservoir1 := OKFsmSpecies named: 'Reservoir1'.
	reservoir2 := OKFsmSpecies named: 'Reservoir2'.
	mosquito := OKFsmSpecies named: 'Mosquito'.
	model
		add: reservoir1;
		add: reservoir2;
		add: mosquito.
	^ model
]

{ #category : #examples }
OKFsmExamples class >> openExamples: models [
	^ self openExamples: models named: models first name , ' example'
]

{ #category : #examples }
OKFsmExamples class >> openExamples: models named: aName [
	| project |
	project := OKFsmProject named: aName.
	models do: [ :each | project addModel: each ].
	OKWorkbench openProject: project
]
