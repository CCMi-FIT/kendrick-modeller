"
I can be linked to if there is a link to an invalid relationship if relationship is not defined by its name, but by names of source and target. 
"
Class {
	#name : #OKRelationshipBrokenReference,
	#superclass : #OKNamedBrokenReference,
	#instVars : [
		'sourceName',
		'targetName'
	],
	#category : 'OpenPonk-Modularity-Models'
}

{ #category : #'instance creation' }
OKRelationshipBrokenReference class >> fromName: aSourceName to: aTargetName [
	^ self new
		sourceName: aSourceName;
		targetName: aTargetName;
		yourself
]

{ #category : #accessing }
OKRelationshipBrokenReference >> source [
	^ OKNamedBrokenReference named: sourceName
]

{ #category : #accessing }
OKRelationshipBrokenReference >> sourceName [
	^ sourceName
]

{ #category : #accessing }
OKRelationshipBrokenReference >> sourceName: aName [
	sourceName := aName
]

{ #category : #accessing }
OKRelationshipBrokenReference >> target [
	^ OKNamedBrokenReference named: targetName
]

{ #category : #accessing }
OKRelationshipBrokenReference >> targetName [
	^ targetName
]

{ #category : #accessing }
OKRelationshipBrokenReference >> targetName: aName [
	targetName := aName
]
