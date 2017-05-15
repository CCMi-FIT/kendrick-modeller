initialization
createTab: aModelview for: aModel
	| tab widget |
	aModelview modelspace: self.
	tab := self instantiate: TabModel.
	tab closeable: false.
	aModelview owner: tab.
	tab label: aModelview class label.
	widget := aModelview buildWithSpec asWidget.
	tab retrievingBlock: [ widget ].
	tabManager addTab: tab.
	aModelview openEditorOn: aModel.
	^ tab