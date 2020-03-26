"
I am a trait defining some features of modular model object (diagram, element...).
"
Trait {
	#name : #OKTModularModelObject,
	#category : 'OpenPonk-Modularity-Models'
}

{ #category : #announcing }
OKTModularModelObject >> announceAdded: anElement [
	self announce: (OPElementAdded element: anElement).
	self dupliciteChanged
]

{ #category : #announcing }
OKTModularModelObject >> announceRemoved: anElement [
	self announce: (OPElementRemoved element: anElement).
	self dupliciteChanged
]

{ #category : #testing }
OKTModularModelObject >> canBeLinkedTo [
	"is it even possible to create a link to me?"
	
	^ self name asString isNotEmpty
]

{ #category : #testing }
OKTModularModelObject >> canBeValidLinkedTo [
	"if a link is created to point to me, should the link be considered valid?"
	
	^ self canBeLinkedTo
]

{ #category : #accessing }
OKTModularModelObject >> dependingElements [
	"elements that cannot be created until I am"

	^ (self ownedElements , self relatedElements) asSet
]

{ #category : #accessing }
OKTModularModelObject >> dependingOnElements [
	"elements that have to be created before I am"

	^ self owner ifNotNil: [ Set with: self owner ] ifNil: [ Set new ]
]

{ #category : #announcing }
OKTModularModelObject >> dupliciteChanged [
	"instead of OPElementChanged, use OKElementChangedDuplicite, to indicate that other announcement was made for a single user-made action, even if it means multiple changes for the model"
	
	self announce: (OKElementChangedDuplicite element: self)
]

{ #category : #testing }
OKTModularModelObject >> isLink [
	^ false
]

{ #category : #announcements }
OKTModularModelObject >> linkRenamed [
	"notify subscribers that I have been 'renamed' by an user -- that means that I now point to broken reference object with different name"
	
	self linkRenamed: self
]

{ #category : #announcements }
OKTModularModelObject >> linkRenamed: anElement [
	"notify subscribers that anElement has been renamed by an user -- that means that it now points to broken reference object with different name"

	self owner ifNotNil: [ :theOwner | theOwner linkRenamed: anElement ]
]

{ #category : #accessing }
OKTModularModelObject >> originalModelObject [
	"links answer linked object ... other kinds of model objects answer self"
	
	^ self
]
