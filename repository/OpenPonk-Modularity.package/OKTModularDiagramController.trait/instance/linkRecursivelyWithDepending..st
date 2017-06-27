private - adding
linkRecursivelyWithDepending: aModel
	"link aModel and recursively also all elements that depend on aModel that have even all other dependencies linked"
	
	| alreadyLinked |
	alreadyLinked := self linkedModels.
	(alreadyLinked includes: aModel)
		ifTrue: [ ^ self ].
	self linkWithoutDependencies: aModel.
	alreadyLinked add: aModel.
	aModel dependingElements
		select: [ :each | alreadyLinked includesAll: each dependingOnElements ]
		thenDo: [ :each | self linkRecursivelyWithDepending: each ]