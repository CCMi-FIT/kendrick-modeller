actions
openAllDiagrams
	disableAutosave := true.
	project models do: [ :each | workbench openEditorOn: each ].
	project resultModels do: [ :each | workbench openResultEditorOn: each ].
	self loadAutosave.
	disableAutosave := false