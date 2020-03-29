"
I am experimental toolbar to control displaying differences (not currently used)
"
Class {
	#name : #OKDiffToolbar,
	#superclass : #ComposableModel,
	#instVars : [
		'noRadio',
		'lastRadio',
		'allRadio',
		'resetButton',
		'radios'
	],
	#category : #'Kendrick-Modeller-Core-Spec'
}

{ #category : #specs }
OKDiffToolbar class >> defaultSpec [
	^ SpecRowLayout composed
		add: #noRadio;
		add: #lastRadio;
		add: #allRadio;
		add: #resetButton;
		yourself
]

{ #category : #accessing }
OKDiffToolbar >> allRadio [
	^ allRadio
]

{ #category : #initialization }
OKDiffToolbar >> initializeWidgets [
	noRadio := self newRadioButton.
	noRadio label: 'No diff'.
	lastRadio := self newRadioButton.
	lastRadio label: 'Last change'.
	allRadio := self newRadioButton.
	allRadio label: 'All changes'.
	resetButton := self newButton.
	resetButton label: 'Clear diff'.
	radios := RadioButtonGroup new
		addRadioButton: noRadio;
		addRadioButton: lastRadio;
		addRadioButton: allRadio;
		default: noRadio;
		yourself
]

{ #category : #accessing }
OKDiffToolbar >> lastRadio [
	^ lastRadio
]

{ #category : #accessing }
OKDiffToolbar >> noRadio [
	^ noRadio
]

{ #category : #accessing }
OKDiffToolbar >> radios [
	^ radios
]

{ #category : #accessing }
OKDiffToolbar >> resetButton [
	^ resetButton
]
