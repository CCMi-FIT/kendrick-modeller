example
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'OpenPonk-Kendrick modularity mockup')
		icon: OPIcons current dynacaseIcon;
		parent: #MostUsedTools;
		action: [ self example ];
		withSeparatorAfter