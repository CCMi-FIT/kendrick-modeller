examples
modelExampleSpecies
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