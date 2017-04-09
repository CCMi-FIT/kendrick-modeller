example
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'OpenPonk-Kendrick modularity example')
		icon: OPIcons current dynacaseIcon;
		parent: #MostUsedTools;
		action: [ self example ];
		withSeparatorAfter