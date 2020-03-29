"
I am a Kendrick status.
"
Class {
	#name : #OKFsmStatus,
	#superclass : #OKFsmState,
	#category : #'Kendrick-Modeller-Kendrick-Models'
}

{ #category : #'OpenPonk-FSM-GraphML-accessing' }
OKFsmStatus class >> graphmlType [
	^ #status
]

{ #category : #hooks }
OKFsmStatus class >> suitableForType: attributeType name: aString [
	^ self kendrickAttributeType = attributeType and: [ aString asSymbol ~= #empty ]
]
