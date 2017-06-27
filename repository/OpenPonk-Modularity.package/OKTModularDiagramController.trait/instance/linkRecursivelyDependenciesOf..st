private - adding
linkRecursivelyDependenciesOf: aModel
	"link all model objects that aModel depends on and while doing all that, link all elements that depend on newly linked ones that have even all other dependencies linked"
	
	(aModel dependingOnElements difference: self linkedModels) do: [ :each | self linkRecursively: each ]