accessing
linkedModel: aModel
	linkedModel := aModel.
	linkedModel when: OPElementChanged do: [ self changed ]