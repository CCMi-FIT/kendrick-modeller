adding
link: aModel
	"first link all model objects that aModel depends on, then link aModel"

	self
		linkDependenciesOf: aModel;
		linkWithoutDependencies: aModel