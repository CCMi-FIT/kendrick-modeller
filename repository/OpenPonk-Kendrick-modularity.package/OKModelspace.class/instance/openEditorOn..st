project handling
openEditorOn: aModel
	tabs := Dictionary new.
	self defaultModelviews
		collect: [ :each | each new ]
		thenDo: [ :each | tabs at: each put: (self createTab: each for: aModel) ]