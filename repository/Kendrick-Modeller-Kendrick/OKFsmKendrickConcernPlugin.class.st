"
I provide information for OpenPonk base about Kendrick concern diagrams and controllers.
"
Class {
	#name : #OKFsmKendrickConcernPlugin,
	#superclass : #OPFsmPlugin,
	#category : #'Kendrick-Modeller-Kendrick-Plugins'
}

{ #category : #accessing }
OKFsmKendrickConcernPlugin >> diagramControllerClass [
	^ OKFsmKendrickConcernController
]

{ #category : #accessing }
OKFsmKendrickConcernPlugin >> icon [
	^ OPIcons current dcOmlBoxIcon
]

{ #category : #accessing }
OKFsmKendrickConcernPlugin >> modelClass [
	^ OKFsmKendrickConcern
]

{ #category : #accessing }
OKFsmKendrickConcernPlugin >> name [
	^ 'Kendrick concern'
]

{ #category : #accessing }
OKFsmKendrickConcernPlugin >> serializerClass [
	^ OKFsmKendrickConcernSerializer
]
