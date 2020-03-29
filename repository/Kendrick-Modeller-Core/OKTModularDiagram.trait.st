"
I am a trait defining some features of modular diagram.
"
Trait {
	#name : #OKTModularDiagram,
	#traits : 'OKTModularModelObject',
	#classTraits : 'OKTModularModelObject classTrait',
	#category : #'Kendrick-Modeller-Core-Models'
}

{ #category : #accessing }
OKTModularDiagram >> edgeLinks [
	"links to relationships"
	
	^ self elements select: [ :each | each isKindOf: OKModuleRelationshipLink ]
]

{ #category : #accessing }
OKTModularDiagram >> elementAndEdgeLinks [
	"links to elements, including relationships"
	
	^ self elements select: [ :each | each isKindOf: OKModulePartLink ]
]

{ #category : #accessing }
OKTModularDiagram >> elementLinksWithoutEdges [
	"links to elements, excluding relationships"
	
	^ self elements select: [ :each | each isKindOf: OKModuleElementLink ]
]

{ #category : #announcing }
OKTModularDiagram >> linkRenamed: anElement [
	self announce: (OKLinkRenamed element: anElement)
]

{ #category : #accessing }
OKTModularDiagram >> linkedModels [
	^ self links collect: #linkedModel
]

{ #category : #accessing }
OKTModularDiagram >> links [
	^ self elements select: [ :each | each isKindOf: OKModularityLink ]
]

{ #category : #announcing }
OKTModularDiagram >> linksUpdated [
	self announce: OPModelContentReplaced.
	self changed
]

{ #category : #accessing }
OKTModularDiagram >> moduleLinks [
	^ self elements select: [ :each | each isKindOf: OKModuleLink ]
]

{ #category : #accessing }
OKTModularDiagram >> originalModelObjects [
	^ self elements collect: [ :each | each originalModelObject ]
]

{ #category : #accessing }
OKTModularDiagram >> views [
	^ {}
]
