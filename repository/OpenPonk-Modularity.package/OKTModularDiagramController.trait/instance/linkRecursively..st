adding
linkRecursively: aModel
	"first link all model objects that aModel depends on, then link aModel, and while doing all that, link all elements that depend on newly linked ones that have even all other dependencies linked"

	self
		linkRecursivelyDependenciesOf: aModel;
		linkRecursivelyWithDepending: aModel