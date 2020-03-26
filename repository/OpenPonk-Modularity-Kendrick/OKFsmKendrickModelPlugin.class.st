"
I provide information for OpenPonk base about Kendrick model diagrams and controllers.
"
Class {
	#name : #OKFsmKendrickModelPlugin,
	#superclass : #OPFsmPlugin,
	#category : 'OpenPonk-Modularity-Kendrick-Plugins'
}

{ #category : #accessing }
OKFsmKendrickModelPlugin >> diagramControllerClass [
	^ OKFsmKendrickModelController
]

{ #category : #accessing }
OKFsmKendrickModelPlugin >> modelClass [
	^ OKFsmKendrickModel
]

{ #category : #accessing }
OKFsmKendrickModelPlugin >> name [
	^ 'Kendrick model'
]

{ #category : #accessing }
OKFsmKendrickModelPlugin >> serializerClass [
	^ OKFsmKendrickModelSerializer
]
