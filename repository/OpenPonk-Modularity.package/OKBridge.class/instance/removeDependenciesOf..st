private
removeDependenciesOf: aDefinitionModel
	"aDefinitionModel is removed from values in dependingModels (so that it not longer inditaces that something depends on aDefinitionModel)"

	dependingModels valuesDo: [ :eachSet | eachSet remove: aDefinitionModel ifAbsent: [  ] ]