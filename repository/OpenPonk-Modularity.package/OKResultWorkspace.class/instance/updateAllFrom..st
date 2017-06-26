opening
updateAllFrom: aProject
	| oldFocusedModel oldTabs oldFocusedViews |
	oldFocusedModel := focusedModel.
	oldFocusedViews := Dictionary new.
	modelspaces keysAndValuesDo: [ :model :pair | oldFocusedViews at: model name put: pair first focusedView ].
	oldTabs := tabManager tabs copy.
	oldTabs do: [ :each | tabManager removeTab: each ].
	aProject resultModels do: [ :each | self openEditorOn: each ].
	modelspaces do: [ :each | each first focusView: (oldFocusedViews at: each first model name ifAbsent: [ 1 ]) ].
	oldFocusedModel ifNil: [ ^ self ].
	self focusEditorOf: (aProject resultModels detect: [ :any | any name = oldFocusedModel name ] ifNone: [ ^ self ])