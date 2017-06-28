private
getExternalModelsFrom: aDiagram
	(aDiagram links allSatisfy: [ :any | any isValid ])
		ifFalse: [ ^ {} ].
	^ {(OKDummyModel named: aDiagram name , '-e1').
	(OKDummyModel named: aDiagram name , '-e2')}