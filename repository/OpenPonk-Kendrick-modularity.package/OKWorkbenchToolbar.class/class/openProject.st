project handling
openProject
	| folder |
	folder := UIManager default chooseDirectory: 'Choose directory containing the project'.
	folder ifNil: [ ^ self ].
	self loadProject: (OKPersistenceProjectReader fromFolder: folder)