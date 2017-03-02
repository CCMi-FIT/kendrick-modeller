world menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'OP Kendrick FSM')
		icon: OPIcons current dcFsmDiagramIcon;
		parent: #Kendrick;
		action: [ self exampleEmpty ];
		with: [ 
					(aBuilder item: #'SIR')
						parent: #'OP Kendrick FSM';
						label: 'SIR example';
						icon: OPIcons current dcFsmDiagramIcon;
						action: [ self exampleSIR ].

					(aBuilder item: #'SIR Species')
						parent: #'OP Kendrick FSM';
						label: 'SIR Species example';
						icon: OPIcons current dcFsmDiagramIcon;
						action: [ self exampleSpeciesSIR ] ];
		withSeparatorAfter