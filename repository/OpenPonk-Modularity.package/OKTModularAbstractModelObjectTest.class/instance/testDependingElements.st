tests
testDependingElements
	| innerObject outerObject |
	innerObject := self newObject.
	outerObject := OKDummyModularDiagram new.
	self assert: innerObject dependingElements size equals: 0.
	self assert: object dependingElements size equals: 0.
	self assert: outerObject dependingElements size equals: 0.
	outerObject add: object.
	object add: innerObject.
	self assert: innerObject dependingElements size equals: 0.
	self assert: object dependingElements size equals: 1.
	self assert: (object dependingElements includes: innerObject).
	self assert: outerObject dependingElements size equals: 1.
	self assert: (outerObject dependingElements includes: object).