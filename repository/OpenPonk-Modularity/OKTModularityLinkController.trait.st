"
I am a trait defining some features of a controller of a link to another diagram or to an element in another diagram.
"
Trait {
	#name : #OKTModularityLinkController,
	#category : 'OpenPonk-Modularity-Controllers'
}

{ #category : #'instance creation' }
OKTModularityLinkController classSide >> linkedModel: aModel [
	^ self new
		linkedModel: aModel;
		yourself
]

{ #category : #adding }
OKTModularityLinkController >> addTo: aDiagramController [
	aDiagramController addAsTargetFor: self
]

{ #category : #accessing }
OKTModularityLinkController >> linkedModel [
	^ self model linkedModel
]

{ #category : #accessing }
OKTModularityLinkController >> linkedModel: aModel [
	self model: (self modelClass linkedModel: aModel)
]

{ #category : #'canvas actions' }
OKTModularityLinkController >> showAcceptFeedbackFor: aController [
	"Return something that understands #remove, or nil to not show any feedback."

	^ OKAcceptDenyFeedbackBuilder acceptFeedbackFor: self figure
]

{ #category : #'canvas actions' }
OKTModularityLinkController >> showDenyFeedbackFor: aController [
	"Return something that understands #remove, or nil to not show any feedback."

	^ OKAcceptDenyFeedbackBuilder denyFeedbackFor: self figure
]

{ #category : #'canvas actions' }
OKTModularityLinkController >> showSelectionFeedback [
	super showSelectionFeedback.
	self refreshFigure
]
