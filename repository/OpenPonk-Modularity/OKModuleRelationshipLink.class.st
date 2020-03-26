"
I am an element representing a link to an source-target relationship element from another diagram. I can be used, for example, to modify the element or to create another element which needs to be connected to me in some way.

I am not only a link to relationship, but I am also a relationship from a source link to target link.
"
Class {
	#name : #OKModuleRelationshipLink,
	#superclass : #OKModulePartLink,
	#instVars : [
		'source',
		'target'
	],
	#category : 'OpenPonk-Modularity-Models'
}

{ #category : #'instance creation' }
OKModuleRelationshipLink class >> from: aSourceObject to: aTargetObject [
	^ self new
		from: aSourceObject to: aTargetObject;
		yourself
]

{ #category : #testing }
OKModuleRelationshipLink >> canBeLinkedTo [
	"is it even possible to create a link to me? it is if my source and target can be linked to"
	
	^ self source canBeLinkedTo and: [ self target canBeLinkedTo ]
]

{ #category : #testing }
OKModuleRelationshipLink >> canBeValidLinkedTo [
	"if a link is created to point to me, should the link be considered valid? it is if the same applies for my source and target"
	
	^ self source canBeValidLinkedTo and: [ self target canBeValidLinkedTo ]
]

{ #category : #testing }
OKModuleRelationshipLink >> canRelinkTo: aModelObject [
	"can I point to aModelObject from now on?"
	
	^ aModelObject canBeLinkedTo
		and: [ (aModelObject respondsTo: #source)
				and: [ aModelObject source name = source name
						and: [ (aModelObject respondsTo: #target)
								and: [ aModelObject target name = target name ] ] ] ]
]

{ #category : #accessing }
OKModuleRelationshipLink >> dependingOnElements [
	"elements that have to be created before I am"

	^ super dependingOnElements
		add: self source;
		add: self target;
		yourself
]

{ #category : #accessing }
OKModuleRelationshipLink >> from: aSourceObject to: aTargetObject [
	self source: aSourceObject.
	self target: aTargetObject
]

{ #category : #testing }
OKModuleRelationshipLink >> isValid [
	"do I point to an model object that can be validly linked to? if not, no result should be produces out of a model I am part of"

	^ source canBeValidLinkedTo
		and: [ target canBeValidLinkedTo and: [ super isValid ] ]
]

{ #category : #forwarding }
OKModuleRelationshipLink >> linkedModelSource [
	^ linkedModel source
]

{ #category : #forwarding }
OKModuleRelationshipLink >> linkedModelTarget [
	^ linkedModel target
]

{ #category : #accessing }
OKModuleRelationshipLink >> name: aString [
	"do nothing -- relationships are not linked by a name, although subclasses can redefine that"
]

{ #category : #accessing }
OKModuleRelationshipLink >> source [
	^ source
]

{ #category : #accessing }
OKModuleRelationshipLink >> source: aModelObject [
	source := aModelObject
]

{ #category : #accessing }
OKModuleRelationshipLink >> target [
	^ target
]

{ #category : #accessing }
OKModuleRelationshipLink >> target: aModelObject [
	target := aModelObject
]
