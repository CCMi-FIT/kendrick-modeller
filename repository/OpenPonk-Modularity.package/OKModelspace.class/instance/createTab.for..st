initialization
createTab: aModelview for: aModel
	| tab widget |
	aModelview modelspace: self.
	tab := self instantiate: TabModel.
	tab closeable: false.
	aModelview owner: tab.
	tab label: aModelview class label.
	tab whenTabSelected: [ focusedView := tabManager tabs indexOf: tab ].
	widget := aModelview buildWithSpec asWidget.
	tab retrievingBlock: [ widget ].
	tabManager addTab: tab.
	aModelview openEditorOn: aModel.
	^ tab