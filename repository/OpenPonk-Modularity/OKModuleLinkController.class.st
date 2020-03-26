"
I am an controller of OKModule.
"
Class {
	#name : #OKModuleLinkController,
	#superclass : #OPElementController,
	#traits : 'OKTModuleLinkController',
	#classTraits : 'OKTModuleLinkController classTrait',
	#category : 'OpenPonk-Modularity-Controllers'
}

{ #category : #figures }
OKModuleLinkController >> moduleIndex [
	"position of this module link in collection of all module links"
	
	^ ((self diagramController model moduleLinks
		select: [ :each | each isKindOf: self modelClass ])
		asSortedCollection: [ :a :b | a name < b name ]) indexOf: self model
]
