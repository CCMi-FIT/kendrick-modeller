"
I am a subclass of element link for Kendrick models. Note that I do not replace shape of the link for now, but I probably should when I am used for anything else than Kendrick states.
"
Class {
	#name : #OKFsmModuleElementLinkController,
	#superclass : #OKModuleElementLinkController,
	#category : #'Kendrick-Modeller-Kendrick-Controllers'
}

{ #category : #forms }
OKFsmModuleElementLinkController >> buildEditorForm: aForm [
	super buildEditorForm: aForm.
	(aForm addTextInput: 'Split with indexes')
		text: self model splitIndexesAsString;
		whenTextIsAccepted: [ :newValue | self model parseSplitIndexes: newValue ]
]

{ #category : #testing }
OKFsmModuleElementLinkController >> canBeSourceFor: aController [
	^ (aController isKindOf: OKFsmTransitionController)
		or: [ aController isKindOf: OKModuleRelationshipLinkController ]
]

{ #category : #testing }
OKFsmModuleElementLinkController >> canBeTargetFor: aController [
	^ self canBeSourceFor: aController
]

{ #category : #accessing }
OKFsmModuleElementLinkController >> modelClass [
	^ OKFsmModuleElementLink
]
