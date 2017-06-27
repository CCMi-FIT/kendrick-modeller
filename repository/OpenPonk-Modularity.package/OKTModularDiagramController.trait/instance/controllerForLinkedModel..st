controllers management
controllerForLinkedModel: aModel
	"similar to OPDiagramController>>#controllerForModel:, just to answer link controllers for given models, not usual controllers"

	aModel = self model originalModelObject
		ifTrue: [ ^ self ].
	^ self controllers
		detect: [ :any | any model originalModelObject = aModel ]
		ifNone: [ self error: 'There is no link to ' , aModel asString , ' in ' , self asString ]