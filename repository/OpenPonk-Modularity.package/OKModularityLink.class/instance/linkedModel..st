accessing
linkedModel: aModel
	linkedModel := aModel.
	linkedModel whenChanged: [ self changed ]