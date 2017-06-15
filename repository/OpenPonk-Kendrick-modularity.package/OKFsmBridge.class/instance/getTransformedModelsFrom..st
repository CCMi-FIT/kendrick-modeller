private
getTransformedModelsFrom: aKendrickDSLModel
	| model |
	model := OKFsmKendrickConcern new.
	aKendrickDSLModel attributes
		do: [ :each | 
			| modelClass |
			modelClass := OKFsmState allSubclasses
				detect: [ :any | any graphmlType = each key asSymbol ].
			model addAll: (each collect: [ :eachName | modelClass named: eachName asString ]) ].
	aKendrickDSLModel transitions do: [ :each |  ].
	^ {model}