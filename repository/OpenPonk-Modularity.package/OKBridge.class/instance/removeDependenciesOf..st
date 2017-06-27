private
removeDependenciesOf: aModel
	"aModel is removed from values in dependingModels (so that it not longer inditaces that something depends on aModel)"

	dependingModels valuesDo: [ :eachSet | eachSet remove: aModel ifAbsent: [  ] ]