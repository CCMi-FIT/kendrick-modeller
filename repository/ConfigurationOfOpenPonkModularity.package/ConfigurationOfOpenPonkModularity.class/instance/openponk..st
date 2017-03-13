symbolic versions
openponk: spec
	<version: '0.0.1-openponk'>
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonk'
					with: [ spec repository: 'github://openponk/openponk/repository' ];
				baseline: 'FsmEditor'
					with: [ spec repository: 'github://openponk/fsm-editor/repository' ];
				package: 'OpenPonk-Kendrick-modularity'
					with: [ spec requires: #('OpenPonk' 'FsmEditor') ] ]