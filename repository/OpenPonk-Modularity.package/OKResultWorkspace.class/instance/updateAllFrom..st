opening
updateAllFrom: aProject
	"replace all my modespaces by new ones for current resulting models in aProject"

	| oldFocusedModel oldTabs oldFocusedViews |
	oldFocusedModel := focusedModel.
	oldFocusedViews := (modelspaces values collect: [ :each | each first model name -> each first focusedView ]) asDictionary.
	oldTabs := tabManager tabs copy.
	oldTabs do: [ :each | tabManager removeTab: each ].
	aProject resultingModels do: [ :each | self openEditorOn: each ].
	modelspaces do: [ :each | each first focusView: (oldFocusedViews at: each first model name ifAbsent: [ 1 ]) ].
	oldFocusedModel ifNil: [ ^ self ].
	self focusEditorOf: (aProject resultingModels detect: [ :any | any name = oldFocusedModel name ] ifNone: [ ^ self ])