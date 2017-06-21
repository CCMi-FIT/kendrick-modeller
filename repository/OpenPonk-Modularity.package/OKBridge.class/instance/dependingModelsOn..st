accessing
dependingModelsOn: aResultDiagram
	^ dependingModels at: aResultDiagram name ifAbsentPut: [ Set new ]