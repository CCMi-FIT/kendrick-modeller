baselines
baseline: spec
	<baseline>
	self resetMetacello.
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
				package: 'OpenPonk-Kendrick-modularity'.
			spec
				group: 'default'
				with: #('OpenPonk' 'FsmEditor' 'Kendrick' 'OpenPonk-Kendrick-modularity').
			spec group: 'kendrick' with: #('Kendrick' 'OpenPonk-Kendrick-modularity').
			spec group: 'openponk' with: #('OpenPonk' 'FsmEditor' 'OpenPonk-Kendrick-modularity').
			spec group: 'package' with: #('OpenPonk-Kendrick-modularity') ]