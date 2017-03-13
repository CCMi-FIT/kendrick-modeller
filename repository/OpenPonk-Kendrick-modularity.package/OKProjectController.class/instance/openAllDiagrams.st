actions
openAllDiagrams
	disableAutosave := true.
	project models do: [ :each | workbench openEditorOn: each ].
	self loadAutosave.
	disableAutosave := false