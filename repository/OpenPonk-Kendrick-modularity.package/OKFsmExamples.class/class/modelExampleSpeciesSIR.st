examples
modelExampleSpeciesSIR
	| model r1S r1I r1R r2S r2I r2R mS mI mR |
	model := OKFsmKendrickModel named: 'SIR Species'.
	r1S := OKFsmStatus named: 'S - Reservoir 1'.
	r1I := OKFsmStatus named: 'I - Reservoir 1'.
	r1R := OKFsmStatus named: 'R - Reservoir 1'.
	r2S := OKFsmStatus named: 'S - Reservoir 2'.
	r2I := OKFsmStatus named: 'I - Reservoir 2'.
	r2R := OKFsmStatus named: 'R - Reservoir 2'.
	mS := OKFsmStatus named: 'S - Mosquito'.
	mI := OKFsmStatus named: 'I - Mosquito'.
	mR := OKFsmStatus named: 'R - Mosquito'.
	model
		add: r1S;
		add: r1I;
		add: r1R;
		add: r2S;
		add: r2I;
		add: r2R;
		add: mS;
		add: mI;
		add: mR.
	model
		addAll:
			{(r1I --> mS name: 'mu*0.5').
			(mI --> r1S name: 'gamma*beta').
			(r2I --> mS name: 'delta').
			(mI --> r2S name: '0.5').
			(r1S -> r1S name: 'lambda').
			(r1S -> r1I name: 'mu').
			(r1I -> r1R name: 'gamma').
			(r1R -> r1R name: 'delta').
			(r2S -> r2S name: 'lambda').
			(r2S -> r2I name: 'mu').
			(r2I -> r2R name: 'gamma').
			(r2R -> r2R name: 'delta').
			(mS -> mS name: 'lambda').
			(mS -> mI name: 'mu').
			(mI -> mR name: 'gamma').
			(mR -> mR name: 'delta')}.
	^ model