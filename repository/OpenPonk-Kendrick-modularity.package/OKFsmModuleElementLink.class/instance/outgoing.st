as yet unclassified
outgoing
	owner ifNil: [ ^ #() ].
	^ owner transitions select: [ :each | each source = self ]