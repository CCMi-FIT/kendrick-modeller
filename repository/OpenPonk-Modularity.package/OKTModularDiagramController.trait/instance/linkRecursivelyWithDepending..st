private - adding
linkRecursivelyWithDepending: aModel
	| alreadyLinked |
	alreadyLinked := self linkedModels.
	(alreadyLinked includes: aModel)
		ifTrue: [ ^ self ].
	self linkWithoutDependencies: aModel.
	alreadyLinked add: aModel.
	aModel dependingElements
		select: [ :each | alreadyLinked includesAll: each dependingOnElements ]
		thenDo: [ :each | self linkRecursivelyWithDepending: each ]