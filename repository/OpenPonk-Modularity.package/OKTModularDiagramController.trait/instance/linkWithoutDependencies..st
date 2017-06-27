private - adding
linkWithoutDependencies: aModel
	"just link aModel, do not care for dependencies"
	
	((self linkControllerNameFor: aModel) linkedModel: aModel) addTo: self