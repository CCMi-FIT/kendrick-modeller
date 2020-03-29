"
I am an OpenPonk-friendly representation of Kendrick concern (KEModelPart).
"
Class {
	#name : #OKFsmKendrickConcern,
	#superclass : #OKFsm,
	#category : #'Kendrick-Modeller-Kendrick-Models'
}

{ #category : #hooks }
OKFsmKendrickConcern class >> classFor: aKendrickModel [
	^ self
]

{ #category : #testing }
OKFsmKendrickConcern >> isConcern [
	^ true
]

{ #category : #hooks }
OKFsmKendrickConcern >> kendrickClass [
	^ KEModelPart
]

{ #category : #accessing }
OKFsmKendrickConcern >> module [
	^ self elements detect: [ :any | any isKindOf: OKModuleLink ] ifNone: [ nil ]
]
