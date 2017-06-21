private - adding
linkDependenciesOf: aModel
	(aModel dependingOnElements difference: self model originalModelObjects)
		do: [ :each | self link: each ]