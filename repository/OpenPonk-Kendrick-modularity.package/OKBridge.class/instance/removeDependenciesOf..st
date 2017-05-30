private
removeDependenciesOf: aModel
	dependingModels valuesDo: [ :eachSet | eachSet remove: aModel ifAbsent: [  ] ]