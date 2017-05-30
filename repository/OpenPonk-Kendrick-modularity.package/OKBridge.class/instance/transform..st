private
transform: anOpenPonkDiagram
	| newTransformedModels |
	externalModels at: anOpenPonkDiagram put: (self getExternalModelsFrom: anOpenPonkDiagram).
	newTransformedModels := self getTransformedModelsFrom: anOpenPonkDiagram.
	transformedModels at: anOpenPonkDiagram put: newTransformedModels.
	newTransformedModels
		do: [ :eachResultModel | 
			(self dependingModelsOn: eachResultModel)
				do: [ :eachDependingModel | self updateLinksIn: eachDependingModel ] ]