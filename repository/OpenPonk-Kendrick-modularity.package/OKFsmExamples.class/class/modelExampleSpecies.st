examples
modelExampleSpecies
	| model reservoir1 reservoir2 mosquito |
	model := OKFsmKendrickConcern named: 'Species'.
	reservoir1 := OKFsmSpecies named: 'Reservoir 1'.
	reservoir2 := OKFsmSpecies named: 'Reservoir 2'.
	mosquito := OKFsmSpecies named: 'Mosquito'.
	model
		add: reservoir1;
		add: reservoir2;
		add: mosquito.
	model
		addAll:
			{(reservoir1 --> mosquito name: 'mu*0.5').
			(mosquito --> reservoir1 name: 'gamma*beta').
			(reservoir2 --> mosquito name: 'delta').
			(mosquito --> reservoir2 name: '1')}.
	^ model