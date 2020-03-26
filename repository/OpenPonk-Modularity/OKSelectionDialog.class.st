"
I am a dialog for selection in a list.
"
Class {
	#name : #OKSelectionDialog,
	#superclass : #ComposableModel,
	#instVars : [
		'list'
	],
	#category : 'OpenPonk-Modularity-Spec'
}

{ #category : #specs }
OKSelectionDialog class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :col | col add: #list ];
		yourself
]

{ #category : #initialization }
OKSelectionDialog >> initializeWidgets [
	list := self instantiate: ListModel
]

{ #category : #api }
OKSelectionDialog >> items: aCollection [
	list
		items:
			(aCollection
				collect: [ :each | self listNameFor: each ]);
		whenSelectionIndexChanged: [ :selectedIndex | 
			self
				selected: (aCollection at: selectedIndex);
				delete ]
]

{ #category : #accessing }
OKSelectionDialog >> list [
	^ list
]

{ #category : #protected }
OKSelectionDialog >> listNameFor: anItem [
	^ anItem asString
]

{ #category : #accessing }
OKSelectionDialog >> selected: anObject [
	"do a proper action because anObject was selected"
	
	self subclassResponsibility
]
