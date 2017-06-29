examples
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'OpenPonk-Modularity-Kendrick examples')
		icon: OPIcons current dynacaseIcon;
		parent: #MostUsedTools;
		action: [ self exampleEmpty ];
		with: [ (aBuilder item: #'Empty concern')
				icon: OPIcons current dynacaseIcon;
				parent: #'OpenPonk-Modularity-Kendrick examples';
				action: [ self exampleEmptyConcern ].
			(aBuilder item: #'Empty model')
				icon: OPIcons current dynacaseIcon;
				parent: #'OpenPonk-Modularity-Kendrick examples';
				action: [ self exampleEmptyModel ].
			(aBuilder item: #'Unused SIR and species concerns')
				icon: OPIcons current dynacaseIcon;
				parent: #'OpenPonk-Modularity-Kendrick examples';
				action: [ self example ].
			(aBuilder item: #'SIR and species simulation')
				icon: OPIcons current dynacaseIcon;
				parent: #'OpenPonk-Modularity-Kendrick examples';
				action: [ self exampleSimulation ] ]