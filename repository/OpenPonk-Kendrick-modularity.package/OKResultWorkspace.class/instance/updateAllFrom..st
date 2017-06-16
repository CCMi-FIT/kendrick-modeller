opening
updateAllFrom: aProject
	| oldFocusedModel oldTabs |
	oldFocusedModel := focusedModel.
	oldTabs := tabManager tabs copy.
	oldTabs do: [ :each | tabManager removeTab: each ].
	aProject resultModels do: [ :each | self openEditorOn: each ].
	self focusEditorOf: (aProject resultModels detect: [ :any | any name = focusedModel name ] ifNone: [ ^ self ])