figures
moduleIndex
	^ ((self diagramController model modules
		select: [ :each | each isKindOf: self modelClass ])
		asSortedCollection: [ :a :b | a name < b name ]) indexOf: self model