"
I am a trait defining some features of a controller of a module - link to another diagram.
"
Trait {
	#name : #OKTModuleLinkController,
	#traits : 'OKTModularityLinkController',
	#classTraits : 'OKTModularityLinkController classTrait',
	#category : 'OpenPonk-Modularity-Controllers'
}

{ #category : #figures }
OKTModuleLinkController >> createFigure [
	"Just as my ModuleElementLinkController counterpart, I have hardcoded shape on canvas, but my shape (figure) can be easily changed by subclasses if needed."
		
	^ OPRTCallbackBuilder
		block: [ :view | 
			| roassalShape |
			roassalShape := RTBox new
				height: 26;
				width: 150;
				colorElement: [ :el | 
					self model isValid
						ifTrue: [ Color veryVeryLightGray ]
						ifFalse: [ Color red ] ];
				borderColor: Color veryVeryDarkGray;
				borderWidth: 1.5;
				yourself.
			(roassalShape elementOn: self model)
				setAsFixed;
				@
					(RTLabeled new
						view: view;
						center;
						fontSize: 12;
						color: Color black;
						yourself);
				@ OPRTFocusable;
				yourself ]
]

{ #category : #figures }
OKTModuleLinkController >> moduleIndex [
	"position of this module link in collection of all module links"
	
	^ ((self diagramController model modules
		select: [ :each | each isKindOf: self modelClass ])
		asSortedCollection: [ :a :b | a name < b name ]) indexOf: self model
]

{ #category : #figures }
OKTModuleLinkController >> positionOfTrachelShape: trachelShape index: index [
	"compute a position of fixed shape on canvas if it is on index position amongst all other module links"

	^ (trachelShape height / 2 * index + (trachelShape width * (index - (1 / 2))))
		@ trachelShape height
]

{ #category : #figures }
OKTModuleLinkController >> refreshFigure [
	| trachelShape |
	self figure update.
	(self figure attributeAt: #RTLabelledLabel)
		setAsFixed;
		text: self model name.
	trachelShape := self figure trachelShape.
	trachelShape
		translateTo: (self positionOfTrachelShape: trachelShape index: self moduleIndex).
	super refreshFigure
]
