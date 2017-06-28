tests
testBasicCreationWithProject
	bridge project: OKDummyProject new.
	self assert: bridge definitionModels size equals: 2.
	self assert: (bridge definitionModels anySatisfy: [ :any | any name = 'X' ]).
	self assert: (bridge definitionModels anySatisfy: [ :any | any name = 'Y' ])