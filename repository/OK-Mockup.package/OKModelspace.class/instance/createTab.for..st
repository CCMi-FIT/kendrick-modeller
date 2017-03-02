initialization
createTab: anEditor for: aModel
	| tab widget |
	anEditor modelspace: self.
	anEditor openEditorOn: aModel.
	tab := self instantiate: TabModel.
	widget := anEditor buildWithSpec asWidget.
	anEditor owner: tab.
	tab retrievingBlock: [ widget ].
	tab label: anEditor class asString.
	tabManager addTab: tab.
	^ tab