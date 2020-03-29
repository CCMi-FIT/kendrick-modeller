"
I am a trait defining some features of an relationship in modular diagram.
"
Trait {
	#name : #OKTModularRelationship,
	#traits : 'OKTModularModelObject',
	#classTraits : 'OKTModularModelObject classTrait',
	#category : #'Kendrick-Modeller-Core-Models'
}

{ #category : #testing }
OKTModularRelationship >> canBeLinkedTo [
	"is it even possible to create a link to me? it is if my source and target can be linked to"
	
	^ self source canBeLinkedTo and: [ self target canBeLinkedTo ]
]

{ #category : #testing }
OKTModularRelationship >> canBeValidLinkedTo [
	"if a link is created to point to me, should the link be considered valid? it is if the same applies for my source and target"
	
	^ self source canBeValidLinkedTo and: [ self target canBeValidLinkedTo ]
]

{ #category : #accessing }
OKTModularRelationship >> dependingOnElements [
	"elements that have to be created before I am"

	^ Set with: self source with: self target
]
