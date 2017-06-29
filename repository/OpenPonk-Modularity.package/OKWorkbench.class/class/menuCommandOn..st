world menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'OpenPonk-Modularity')
		icon: OPIcons current dynacaseIcon;
		action: [ self open ];
		withSeparatorAfter