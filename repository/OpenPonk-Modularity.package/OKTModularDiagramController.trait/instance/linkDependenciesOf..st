private - adding
linkDependenciesOf: aModel
	"link all model objects that aModel depends on"

	(aModel dependingOnElements difference: self model originalModelObjects)
		do: [ :each | self link: each ]