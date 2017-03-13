opening
openEditorOn: aModel
	| tab plugin widget |
	editor := self class editorClass new.
	editor workbench: self.
	plugin := self pluginRegistry pluginFor: aModel.
	editor plugin: plugin.
	tab := self newTab.
	widget := editor buildWithSpec asWidget.
	editor owner: tab.
	editor openModel: aModel.
	editor paletteModel rebuildWidget.
	tab
		retrievingBlock: [ widget ];
		whenBuiltDo: [ :w | w widget when: #tabDeleted send: #tabDeleted to: editor ].
	tabManager addTab: tab.
	self focusEditorOf: aModel