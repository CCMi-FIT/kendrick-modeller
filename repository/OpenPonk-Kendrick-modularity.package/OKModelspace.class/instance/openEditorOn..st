project handling
openEditorOn: aModel
	modellingEditor := OKModelviewEdit new.
	programmingEditor := OKModelviewCode new.
	resultEditor := OKModelviewResult new.
	self createTab: modellingEditor for: aModel.
	self createTab: programmingEditor for: aModel.
	self createTab: resultEditor for: aModel