figures
moduleIndex
	| modules index |
	modules := self diagramController model modules.
	index := ((modules select: [ :each | each class = self modelClass ])
		asSortedCollection: [ :a :b | a name < b name ]) indexOf: self model.
	index isZero
		ifFalse: [ ^ index ].
	^ modules size + 1