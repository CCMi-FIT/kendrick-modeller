examples
modelExampleSIR
	| model s i r |
	model := OKFsm named: 'SIR'.
	s := OKFsmStatus named: 'S'.
	i := OKFsmStatus named: 'I'.
	r := OKFsmStatus named: 'R'.
	model
		add: s;
		add: i;
		add: r.
	model
		addAll:
			{(s -> s name: 'lambda').
			(s -> i name: 'mu').
			(i -> r name: 'gamma').
			(r -> r name: 'delta')}.
	^ model