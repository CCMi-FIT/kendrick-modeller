Class {
	#name : #OKFsmSpeciesController,
	#superclass : #OKFsmStateController,
	#category : 'OpenPonk-Modularity-Kendrick-Controllers'
}

{ #category : #testing }
OKFsmSpeciesController >> canBeSourceFor: aController [
	^ aController isKindOf: OKModuleRelationshipLinkController
]

{ #category : #hooks }
OKFsmSpeciesController >> figureClass [
	^ OKFsmSpeciesFigure
]

{ #category : #accessing }
OKFsmSpeciesController >> modelClass [
	^ OKFsmSpecies
]
