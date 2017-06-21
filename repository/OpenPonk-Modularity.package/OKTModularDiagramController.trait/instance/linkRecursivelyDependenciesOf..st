private - adding
linkRecursivelyDependenciesOf: aModel
	(aModel dependingOnElements difference: self linkedModels) do: [ :each | self linkRecursively: each ]