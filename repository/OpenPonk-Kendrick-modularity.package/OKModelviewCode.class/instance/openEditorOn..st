opening
openEditorOn: aModel
	| tab widget |
	editor := self newCode.
	aModel name = 'SIR'
		ifTrue: [ editor
				text:
					'KendrickModel SIR
	attribute: #(status -> S I R);
	parameters: #(beta lambda gamma mu);
	transitions: #(
		S -- lambda --> I.
		I -- gamma --> R.
		status -- mu --> Empty.
		Empty -- mu --> S.
	).' ].
	aModel name = 'Species'
		ifTrue: [ editor
				text:
					'KendrickModel Species
	parameters: #(rho);
	attribute: #(species -> mosquito reservoir1 reservoir2).' ].
	aModel name = 'SIR Species'
		ifTrue: [ editor
				text:
					'Composition Mosquito
	model: ''Mosquito'';
	concern: ''SIR'';
	concern: ''Species'';
	N: #(species);	
	lambda: #(beta*rho*I sum).' ].
	tab := self newTab.
	widget := editor buildWithSpec asWidget.
	tab retrievingBlock: [ widget ].
	tabManager addTab: tab.
	self focusEditorOf: aModel