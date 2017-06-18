user interface
openFor: anOpenPonkModel
	^ (self allInstances
		detect: [ :any | any model == anOpenPonkModel and: [ any hasWindow ] ]
		ifNone: [ self new
		model: anOpenPonkModel;
		yourself ])
		openWithSpec;
		yourself