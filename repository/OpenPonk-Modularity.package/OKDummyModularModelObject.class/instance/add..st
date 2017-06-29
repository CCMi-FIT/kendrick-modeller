adding
add: anElement
	(elements includes: anElement)
		ifTrue: [ ^ self ].
	anElement addedTo: self.
	elements add: anElement