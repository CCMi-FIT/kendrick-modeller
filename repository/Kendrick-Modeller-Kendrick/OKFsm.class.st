"
I am an abstract OpenPonk-friendly representation of Kendrick model or composition.
"
Class {
	#name : #OKFsm,
	#superclass : #OPFsm,
	#traits : 'OKTModularDiagram',
	#classTraits : 'OKTModularDiagram classTrait',
	#instVars : [
		'externalKendrickModel',
		'parameters',
		'additionalCode'
	],
	#category : #'Kendrick-Modeller-Kendrick-Models'
}

{ #category : #'instance creation' }
OKFsm class >> basedOn: aKendrickModel [
	^ (self classFor: aKendrickModel) new
		externalKendrickModel: aKendrickModel;
		yourself
]

{ #category : #hooks }
OKFsm class >> classFor: aKendrickModel [
	^ ((aKendrickModel isKindOf: KEModelPart)
		ifTrue: [ OKFsmKendrickConcern ]
		ifFalse: [ OKFsmKendrickModel ]) classFor: aKendrickModel
]

{ #category : #'instance creation' }
OKFsm class >> named: aString basedOn: aKendrickModel [
	^ (self basedOn: aKendrickModel)
		name: aString;
		yourself
]

{ #category : #accessing }
OKFsm >> additionalCode [
	^ additionalCode
]

{ #category : #accessing }
OKFsm >> additionalCode: aCode [
	additionalCode := aCode.
	self changed
]

{ #category : #accessing }
OKFsm >> additionalCodeBlock [
	^ BlockClosure readFrom: '[ :model | ' , self additionalCode , ' ]'
]

{ #category : #accessing }
OKFsm >> externalKendrickModel [
	^ externalKendrickModel
]

{ #category : #accessing }
OKFsm >> externalKendrickModel: anExternalKendrickModel [
	externalKendrickModel := anExternalKendrickModel
]

{ #category : #initialization }
OKFsm >> initialize [
	super initialize.
	parameters := Dictionary new.
	additionalCode := ''
]

{ #category : #testing }
OKFsm >> isBasedOn: anExternalKendrickModel [
	^ externalKendrickModel = anExternalKendrickModel
]

{ #category : #testing }
OKFsm >> isConcern [
	^ false
]

{ #category : #testing }
OKFsm >> isSimulationDefined [
	^ false
]

{ #category : #testing }
OKFsm >> isState [
	^ false
]

{ #category : #testing }
OKFsm >> isTransition [
	^ false
]

{ #category : #hooks }
OKFsm >> kendrickClass [
	^ self subclassResponsibility
]

{ #category : #accessing }
OKFsm >> parameters [
	^ parameters
]

{ #category : #accessing }
OKFsm >> parameters: anObject [
	parameters := anObject.
	self changed
]

{ #category : #accessing }
OKFsm >> parametersAsString [
	^ String
		streamContents: [ :stream | 
			parameters
				keysAndValuesDo: [ :key :value | 
					stream
						nextPutAll: key;
						nextPutAll: ': ';
						nextPutAll: value;
						nextPutAll: '. ' ] ]
]

{ #category : #accessing }
OKFsm >> parseParameters: aString [
	| parts |
	parts := (aString splitOn: '.') flatCollect: [ :each | each splitOn: ':' ].
	self parameters: (Dictionary newFromPairs: (parts collect: [ :each | each trimmed ]))
]
