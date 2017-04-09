world menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'OpenPonk FSM/Kendrick example')
		icon: OPIcons current dcFsmDiagramIcon;
		parent: #MostUsedTools;
		action: [ self exampleEmptyKendrickModel ];
		with: [ (aBuilder item: #SIR)
				parent: #'OpenPonk FSM/Kendrick example';
				label: 'SIR example';
				icon: OPIcons current dcFsmDiagramIcon;
				action: [ self exampleSIR ].
			(aBuilder item: #'SIR Species')
				parent: #'OpenPonk FSM/Kendrick example';
				label: 'SIR Species example';
				icon: OPIcons current dcFsmDiagramIcon;
				action: [ self exampleSpeciesSIR ] ]