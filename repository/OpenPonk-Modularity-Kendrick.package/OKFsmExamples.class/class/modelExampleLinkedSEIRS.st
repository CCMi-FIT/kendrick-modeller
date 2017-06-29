examples
modelExampleLinkedSEIRS
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