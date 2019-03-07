baselines
baseline: spec
	<baseline>
	self resetMetacello.
	spec
		for: #common
		do: [ spec
				baseline: 'FsmEditor'
					with: [ spec repository: 'github://openponk/fsm-editor/repository' ];
				baseline: 'Kendrick'
					with: [ spec repository: 'github://UMMISCO/kendrick:master/src' ];
				package: 'OpenPonk-Modularity' with: [ spec requires: #('FsmEditor') ];
				package: 'OpenPonk-Modularity-Kendrick' with: [ spec requires: #('Kendrick' 'OpenPonk-Modularity') ].
			spec
				group: 'default'
				with: #('OpenPonk-Modularity-Kendrick').
		]
