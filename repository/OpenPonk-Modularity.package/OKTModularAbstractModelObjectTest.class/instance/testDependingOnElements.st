tests
testDependingOnElements
	| innerObject outerObject |
	innerObject := self newObject.
	outerObject := OKDummyModularDiagram new.
	self assert: innerObject dependingOnElements size equals: 0.
	self assert: object dependingOnElements size equals: 0.
	self assert: outerObject dependingOnElements size equals: 0.
	outerObject add: object.
	object add: innerObject.
	self assert: innerObject dependingOnElements size equals: 1.
	self assert: (innerObject dependingOnElements includes: object).
	self assert: object dependingOnElements size equals: 1.
	self assert: (object dependingOnElements includes: outerObject).
	self assert: outerObject dependingOnElements size equals: 0