symbolic versions
bleedingEdge: spec
	<version: '0.0.1-bleedingEdge'>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonk'
					with: [ spec repository: 'github://openponk/openponk/repository' ];
				baseline: 'FsmEditor'
					with: [ spec repository: 'github://openponk/fsm-editor/repository' ];
				project: 'Kendrick'
					with: [ spec
						className: 'ConfigurationOfKendrick';
						versionString: #development;
						repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main' ];
				package: 'OpenPonk-Kendrick-modularity'
					with: [ spec requires: #('OpenPonk' 'FsmEditor' 'Kendrick') ] ]