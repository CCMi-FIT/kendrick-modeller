baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'FsmEditor'
					with: [ spec repository: 'github://openponk/fsm-editor/repository' ];
				baseline: 'Kendrick'
					with: [ spec
						preLoadDoIt: #loadXMLWriter;
						repository: 'github://JanBliznicenko/kendrick/src' ];
				package: 'OpenPonk-Modularity'
					with: [ spec requires: #('FsmEditor') ];
				package: 'OpenPonk-Modularity-Kendrick'
					with: [ spec requires: #('Kendrick' 'OpenPonk-Modularity') ].
			spec group: 'default' with: #('OpenPonk-Modularity-Kendrick') ]