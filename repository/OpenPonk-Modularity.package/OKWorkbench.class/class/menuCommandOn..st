world menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'OpenPonk-Kendrick Modularity Tool')
		icon: OPIcons current dynacaseIcon;
		parent: #MostUsedTools;
		action: [ self open ];
		withSeparatorAfter