example
exampleCode
	^ '
	"this code is based on KEDeterministicExamples>>#modelRK4SolverOnSIRMultiHost"
	|pop| 
	pop := model population initialSize.
	model addParameter: #mu value: 12.17.
	model addParameter: #gamma value: 52.
	model addParameter: #beta value: 1.
	model
		addParameter: #lambda
		value: [ :aModel | (aModel atParameter: #beta) * (aModel atCompartment: {(#status -> #I)}) ].
	model
		atParameter: #mu
		assignValue: [ :aModel | 
			| c val |
			c := aModel currentCompartment at: #species.
			c = #Mosquito
				ifTrue: [ val := 12.17 ].
			c = #Reservoir1
				ifTrue: [ val := 0.05 ].
			c = #Reservoir2
				ifTrue: [ val := 0.05 ].
			val ].
	model
		atParameter: #N
		assignValue: [ :aModel | 
			| c |
			c := aModel currentCompartment at: #species.
			aModel sizeOfPopulation: c ].

	
	model
		addParameter: #rho
		value: [ :aModel | 
			| c val values |
			c := aModel currentCompartment at: #species.
			values := {#Mosquito->({ #Mosquito->0. #Reservoir1->0.02. #Reservoir2->0.02 } asDictionary). #Reservoir1->({ #Mosquito->0.02. #Reservoir1->0. #Reservoir2->0 } asDictionary). #Reservoir2->({ #Mosquito->0.02. #Reservoir1->0. #Reservoir2->0 } asDictionary)} asDictionary.
			"original code is different here, because it is based on order of items in array ... I modified it in a way that order of species does not matter"
			(aModel atAttribute: #species) collect: [:each | (values at: c) at: each ].
		 ].
	model
		atParameter: #lambda
		assignValue: [ :aModel | 
			((aModel atParameter: #beta) * (aModel atParameter: #rho)
				* (aModel atCompartment: {(#status -> #I)})) sum ].
	model
		atCompartment:
			{(#status -> #S).
			(#species -> #Reservoir1)}
		put: (pop / 13) truncated.
	model
		atCompartment:
			{(#status -> #S).
			(#species -> #Reservoir2)}
		put: (pop / 13 * 2) truncated.
	model
		atCompartment:
			{(#status -> #I).
			(#species -> #Mosquito)}
		put: 1.
	model
		atCompartment:
			{(#status -> #S).
			(#species -> #Mosquito)}
		put: (model population initialSize - (1 + ((pop/13*2) truncated) + ((pop/13) truncated))).
	model
		atCompartment:
			{(#status -> #R).
			(#species -> #Mosquito)}
		put: 0.
	model
		atCompartment:
			{(#status -> #I).
			(#species -> #Reservoir1)}
		put: 0.
	model
		atCompartment:
			{(#status -> #R).
			(#species -> #Reservoir1)}
		put: 0.
	model
		atCompartment:
			{(#status -> #I).
			(#species -> #Reservoir2)}
		put: 0.
	model
		atCompartment:
			{(#status -> #R).
			(#species -> #Reservoir2)}
		put: 0'