private
getResultModelsFrom: anExternalModel madeFrom: anOpenPonkDiagram
	"this is a method that subclasses of OKBridge have to implement and it should return an ordered collection of resulting (OpenPonk-friendly) models created from anExternalModel that has been previously created from anOpenPonkDiagram"

	^ self subclassResponsibility