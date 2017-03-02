example
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'Modular example')
		icon: OPIcons current dynacaseIcon;
		parent: #Kendrick;
		action: [ self example ]