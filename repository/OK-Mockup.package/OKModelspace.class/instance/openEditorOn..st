project handling
openEditorOn: aModel
	modellingEditor := OKModellingEditor new.
	programmingEditor := OKProgrammingEditor new.
	resultEditor := OKResultEditor new.
	self createTab: modellingEditor for: aModel.
	self createTab: programmingEditor for: aModel.
	self createTab: resultEditor for: aModel