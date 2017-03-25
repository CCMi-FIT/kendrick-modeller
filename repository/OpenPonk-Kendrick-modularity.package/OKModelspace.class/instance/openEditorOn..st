project handling
openEditorOn: aModel
	modelviewEdit := OKModelviewEdit new.
	"modelviewCode := OKModelviewCode new."
	modelviewResult := OKModelviewResult new.
	tabs := Dictionary new.
	tabs at: modelviewEdit put: (self createTab: modelviewEdit for: aModel).
	"tabs at: modelviewCode put: (self createTab: modelviewCode for: aModel)."
	tabs at: modelviewResult put: (self createTab: modelviewResult for: aModel).
	self workspace isRight
		ifTrue: [ (tabs at: modelviewResult) selected: true ]