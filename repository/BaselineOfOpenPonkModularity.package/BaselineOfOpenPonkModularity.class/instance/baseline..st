baselines
baseline: spec
	<baseline>
	self resetMetacello.
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonk'
					with: [ spec repository: 'github://openponk/openponk:v0.1.0/repository' ];
				baseline: 'FsmEditor'
					with: [ spec repository: 'github://bliznjan/fsm-editor/repository' ];
				project: 'Kendrick'
					with: [ spec
						className: 'ConfigurationOfKendrick';
						versionString: #development;
						repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main' ];
				package: 'OpenPonk-Modularity';
				package: 'OpenPonk-Modularity-Kendrick'.
			spec
				group: 'default'
				with: #('OpenPonk' 'FsmEditor' 'OpenPonk-Modularity' 'Kendrick' 'OpenPonk-Modularity-Kendrick').
			spec
				group: 'kendrick'
				with: #('OpenPonk-Modularity' 'Kendrick' 'OpenPonk-Modularity-Kendrick').
			spec
				group: 'openponk'
				with: #('OpenPonk' 'FsmEditor' 'OpenPonk-Modularity' 'OpenPonk-Modularity-Kendrick').
			spec group: 'package' with: #('OpenPonk-Modularity' 'OpenPonk-Modularity-Kendrick').
			spec group: 'core' with: #('OpenPonk' 'FsmEditor' 'OpenPonk-Modularity') ]