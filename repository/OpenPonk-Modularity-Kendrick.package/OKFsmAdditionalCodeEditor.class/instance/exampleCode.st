example
exampleCode
	^ '|pop| 
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
			c = #''Reservoir 1''
				ifTrue: [ val := 0.05 ].
			c = #''Reservoir 2''
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
			| c val |
			c := aModel currentCompartment at: #species.
			c = #Mosquito
				ifTrue: [ val := #(0 0.02 0.02) ].
			c = #''Reservoir 1''
				ifTrue: [ val := #(0.02 0 0) ].
			c = #''Reservoir 2''
				ifTrue: [ val := #(0.02 0 0) ].
			val ].
	model
		atParameter: #lambda
		assignValue: [ :aModel | 
			((aModel atParameter: #beta) * (aModel atParameter: #rho)
				* (aModel atCompartment: {(#status -> #I)})) sum ].
	model
		atCompartment:
			{(#status -> #S).
			(#species -> #''Reservoir 1'')}
		put: (pop / 13) truncated.
	model
		atCompartment:
			{(#status -> #S).
			(#species -> #''Reservoir 2'')}
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
			(#species -> #''Reservoir 1'')}
		put: 0.
	model
		atCompartment:
			{(#status -> #R).
			(#species -> #''Reservoir 1'')}
		put: 0.
	model
		atCompartment:
			{(#status -> #I).
			(#species -> #''Reservoir 2'')}
		put: 0.
	model
		atCompartment:
			{(#status -> #R).
			(#species -> #''Reservoir 2'')}
		put: 0'