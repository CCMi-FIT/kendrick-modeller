figures
moduleIndex
	"position of this module link in collection of all module links"
	
	^ ((self diagramController model moduleLinks
		select: [ :each | each isKindOf: self modelClass ])
		asSortedCollection: [ :a :b | a name < b name ]) indexOf: self model