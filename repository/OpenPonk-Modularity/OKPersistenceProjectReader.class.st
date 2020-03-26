"
I am a persistence reader ready for design with different OKProject subclass for each different project kind.
"
Class {
	#name : #OKPersistenceProjectReader,
	#superclass : #OPPersistenceProjectReader,
	#category : 'OpenPonk-Modularity-Persistence'
}

{ #category : #'instance creation' }
OKPersistenceProjectReader class >> fromFolder: aFolder [
	^ self new fromFolder: aFolder
]

{ #category : #reading }
OKPersistenceProjectReader >> readProjectFrom: aFile [
	| project dom |
	dom := XMLDOMParser parse: aFile readStream.
	project := (self class environment
		at: (dom xPath: '//project/type/text()') first string) new.
	project name: (dom xPath: '//project/name/text()') first string.
	project
		uuid: (UUID fromString: (dom xPath: '//project/uuid/text()') first string).
	project storageFolder: aFile parent.
	^ project
]
