updating
updateResultDiagrams
	| diagramsToReplace diagramsToAdd |
	diagramsToReplace := resultModels values
		flatCollect: [ :eachSet | 
			eachSet
				collect: [ :each | 
					each
						->
							((bridge transformedModelsOf: each)
								detect: [ :any | any name = each name ]
								ifNone: [ nil ]) ] ].
	diagramsToAdd := bridge transformedModels values
		flatCollect: [ :eachNewSet | 
			eachNewSet
				reject: [ :eachNew | 
					resultModels
						anySatisfy: [ :anyOldSet | anyOldSet anySatisfy: [ :anyOld | anyOld name = eachNew name ] ] ] ]