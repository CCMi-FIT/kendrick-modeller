Class {
	#name : #BaselineOfKendrickModeller,
	#superclass : #BaselineOf,
	#category : #BaselineOfKendrickModeller
}

{ #category : #baselines }
BaselineOfKendrickModeller >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self
				loadRoassal;
				loadXMLWriter.
			spec
				baseline: 'FsmEditor'
					with: [ spec repository: 'github://openponk/fsm-editor/repository' ];
				baseline: 'Kendrick'
					with: [ spec repository: 'github://JanBliznicenko/kendrick/src' ];
				package: 'OpenPonk-Modularity'
					with: [ spec requires: #('FsmEditor') ];
				package: 'OpenPonk-Modularity-Kendrick'
					with: [ spec requires: #('Kendrick' 'OpenPonk-Modularity') ].
			spec group: 'default' with: #('OpenPonk-Modularity-Kendrick') ]
]

{ #category : #baselines }
BaselineOfKendrickModeller >> loadRoassal [
	Metacello new
		baseline: 'Roassal2';
		repository:
			'github://ObjectProfile/Roassal2:004ab6f3dfd41cf06526c57115ee42cc921e7668/src';
		onConflictUseLoaded;
		lock;
		load
]

{ #category : #baselines }
BaselineOfKendrickModeller >> loadXMLWriter [
	Metacello new
		baseline: 'XMLWriter';
		repository: 'github://pharo-contributions/XML-XMLWriter:2.9.x/src';
		onConflictUseLoaded;
		lock;
		load
]
