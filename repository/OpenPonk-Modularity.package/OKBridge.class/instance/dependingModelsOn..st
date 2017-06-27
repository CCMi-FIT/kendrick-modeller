accessing
dependingModelsOn: aResultDiagram
	"returns set of definition models that depend on (have module link to) models with same name as has the aResultDiagram -- so probably depend on aResultDiagram, if it's not just a conicidence of names"

	^ dependingModels at: aResultDiagram name ifAbsentPut: [ Set new ]