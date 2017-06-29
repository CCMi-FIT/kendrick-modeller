world menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'OpenPonk-Modularity')
		icon: OPIcons current dynacaseIcon;
		parent: #MostUsedTools;
		action: [ self open ];
		withSeparatorAfter