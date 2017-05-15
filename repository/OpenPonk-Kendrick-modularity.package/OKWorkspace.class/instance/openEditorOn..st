opening
openEditorOn: aModel
	| tab plugin widget modelspace |
	modelspace := self newModelspace.
	modelspace workspace: self.
	plugin := self pluginRegistry pluginFor: aModel.
	tab := self newTab.
	tab closeable: false.
	modelspaces at: aModel put: (Array with: modelspace with: tab).
	modelspace owner: tab.
	modelspace openEditorOn: aModel.
	widget := modelspace buildWithSpec asWidget.
	aModel whenChanged: [ tab label: aModel name ].
	tab
		label: aModel name;
		icon: plugin icon;
		retrievingBlock: [ widget ];
		whenBuiltDo: [ :w | 
			w widget when: #tabDeleted send: #tabDeleted to: modelspace.
			w widget when: #tabDeleted evaluate: [ :t | modelspaces removeKey: aModel ] ].
	tabManager addTab: tab