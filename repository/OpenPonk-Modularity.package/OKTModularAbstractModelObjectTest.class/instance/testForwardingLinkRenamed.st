tests
testForwardingLinkRenamed
	| innerObject outerObject |
	innerObject := self newObject.
	outerObject := OKDummyModularDiagram new.
	outerObject add: object.
	object add: innerObject.
	self deny: (outerObject countAnnouncement: OKLinkRenamed) > 0.
	innerObject linkRenamed.
	self assert: (outerObject countAnnouncement: OKLinkRenamed) > 0