api
removed: anElement in: aDefinitionModel
	"call this if anElement has been removed from aDefinitionModel, which is a definition model"

	self update: aDefinitionModel whenChanged: anElement