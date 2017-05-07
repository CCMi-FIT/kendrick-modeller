examples
modelExampleSIR
	| model s i r e |
	model := OKFsmKendrickModel named: 'SIR'.
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
			(r -> e name: 'mu').
			(e -> s name: 'mu')}.
	^ model