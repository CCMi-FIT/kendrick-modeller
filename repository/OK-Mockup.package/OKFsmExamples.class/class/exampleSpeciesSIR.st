examples
exampleSpeciesSIR
	| project fsm3 r1Init r2Init mInit r1S r1I r1R r2S r2I r2R mS mI mR |
	project := OPProject named: 'Species SIR'.
	fsm3 := OKFsm named: 'Species SIR'.
	project := OPProject named: 'SIR species'.
	fsm3 := OKFsm named: 'SIR Species'.
	project addModel: fsm3.
	r1Init := OPFsmInitialState new.
	r2Init := OPFsmInitialState new.
	mInit := OPFsmInitialState new.
	r1S := OPFsmState named: 'S - Reservoir 1'.
	r1I := OPFsmState named: 'I - Reservoir 1'.
	r1R := OPFsmState named: 'R - Reservoir 1'.
	r2S := OPFsmState named: 'S - Reservoir 2'.
	r2I := OPFsmState named: 'I - Reservoir 2'.
	r2R := OPFsmState named: 'R - Reservoir 2'.
	mS := OPFsmState named: 'S - Mosquito'.
	mI := OPFsmState named: 'I - Mosquito'.
	mR := OPFsmState named: 'R - Mosquito'.
	fsm3
		add: r1Init;
		add: r2Init;
		add: mInit;
		add: r1S;
		add: r1I;
		add: r1R;
		add: r2S;
		add: r2I;
		add: r2R;
		add: mS;
		add: mI;
		add: mR.
	fsm3
		addAll:
			{(r1I --> mI name: 'mu*0.5').
			(mI --> r1I name: 'gamma*beta').
			(r2I --> mI name: 'delta').
			(mI --> r2I name: '0.5').
			(r1Init -> r1S).
			(r2Init -> r2S).
			(mInit -> mS).
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
	OPWorkbench openProject: project