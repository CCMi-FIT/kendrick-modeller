project handling
openEditorOn: aModel
	modelviewEdit := OKModelviewEdit new.
	modelviewCode := OKModelviewCode new.
	modelviewResult := OKModelviewResult new.
	self createTab: modelviewEdit for: aModel.
	self createTab: modelviewCode for: aModel.
	self createTab: modelviewResult for: aModel