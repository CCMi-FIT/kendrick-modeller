private
getTransformedModelsFrom: aKendrickModel madeFrom: anOpenPonkDiagram
	| model attributes |
	model := OKFsm named: anOpenPonkDiagram name basedOn: aKendrickModel.
	attributes := Dictionary new.
	aKendrickModel attributes keysAndValuesDo: [ :key :col | attributes at: key put: col copy ].
	attributes ifEmpty: [ ^ {model} ].
	(attributes includesKey: #status)
		ifTrue: [ (attributes at: #status) add: #empty ].
	attributes size = 1
		ifTrue: [ attributes
				keysAndValuesDo: [ :eachType :eachNames | model addAll: (eachNames collect: [ :eachName | OKFsmState named: eachName basedOn: eachType ]) ] ]
		ifFalse: [ | combinations |
			combinations := OrderedCollection with: Dictionary new.
			attributes
				keysAndValuesDo: [ :eachType :eachNames | 
					combinations copy
						do: [ :eachCombination | 
							eachNames
								do: [ :eachName | 
									combinations
										add:
											(eachCombination copy
												at: eachType put: eachName;
												yourself) ].
							combinations remove: eachCombination ] ].
			model
				addAll:
					(combinations
						collect: [ :eachDictionary | 
							| compartment |
							compartment := OKFsmCompartment new.
							eachDictionary
								keysAndValuesDo: [ :eachAttributeType :eachName | compartment addPart: (OKFsmState named: eachName basedOn: eachAttributeType) ].
							compartment ]) ].
	model
		addAll:
			(aKendrickModel transitions
				collect: [ :eachKETransition | 
					eachKETransition from size = 1
						ifTrue: [ OKFsmTransition
								from: (model elements detect: [ :any | any name asSymbol = (eachKETransition from at: any kendrickAttributeType) ])
								to: (model elements detect: [ :any | any name asSymbol = (eachKETransition to at: any kendrickAttributeType) ]) ]
						ifFalse: [ OKFsmTransition
								from:
									(model elements
										detect:
											[ :anyElement | anyElement parts allSatisfy: [ :eachPart | eachPart name asSymbol = (eachKETransition from at: eachPart kendrickAttributeType) ] ])
								to:
									(model elements
										detect:
											[ :anyElement | anyElement parts allSatisfy: [ :eachPart | eachPart name asSymbol = (eachKETransition to at: eachPart kendrickAttributeType) ] ]) ] ]).
	^ {model}