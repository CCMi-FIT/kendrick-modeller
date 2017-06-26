project handling
openEditorOn: aModel
	model := aModel.
	self defaultModelviews do: [ :each | self createTab: each new for: aModel ].
	aModel views do: [ :each | self createTab: OKModelviewRoassal new for: each ]