examples
exampleSIR
	| fsm1 project initial1 zero one two |
	project := OPProject named: 'SIR'.
	fsm1 := OKFsm named: 'SIR'.
	project addModel: fsm1.
	initial1 := OPFsmInitialState new.
	zero := OPFsmState named: 'S'.
	one := OPFsmState named: 'I'.
	two := OPFsmState named: 'R'.
	fsm1
		add: initial1;
		add: zero;
		add: one;
		add: two.
	fsm1
		addAll:
			{(initial1 -> zero).
			(zero -> zero name: 'lambda').
			(zero -> one name: 'mu').
			(one -> two name: 'gamma').
			(two -> two name: 'delta')}.
	OPWorkbench openProject: project