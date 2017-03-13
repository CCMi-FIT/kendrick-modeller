opening
openEditorOn: aModel
	| tab plugin widget |
	(editor := self class editorClass new) workbench: self.
	plugin := pluginRegistry pluginFor: aModel.
	editor plugin: plugin.
	tab := self newTab.
	widget := editor buildWithSpec asWidget.
	editor owner: tab.
	editor openModel: aModel.
	editor paletteModel rebuildWidget.
	tab
		retrievingBlock: [ widget ];
		whenTabSelected: [ self topToolbar activeEditor: editor ];
		whenBuiltDo: [ :w | 
			w widget when: #tabDeleted send: #tabDeleted to: editor.
			w widget when: #tabDeleted evaluate: [ :t | self topToolbar activeEditor: nil ] ].
	tabManager addTab: tab.
	self focusEditorOf: aModel