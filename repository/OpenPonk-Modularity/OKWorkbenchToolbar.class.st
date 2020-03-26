"
I am top menu toolbar for OKWorkbench.
"
Class {
	#name : #OKWorkbenchToolbar,
	#superclass : #DynamicComposableModel,
	#instVars : [
		'toolbar'
	],
	#category : 'OpenPonk-Modularity-Spec'
}

{ #category : #specs }
OKWorkbenchToolbar class >> defaultSpec [
	^ SpecLayout composed
		newRow: [ :row | row add: #toolbar ];
		yourself
]

{ #category : #'project handling' }
OKWorkbenchToolbar class >> loadProject: aProject [
	aProject
		saveInImage;
		open
]

{ #category : #'project handling' }
OKWorkbenchToolbar class >> newProject [
	| projectClasses |
	projectClasses := OKProject allSubclasses asOrderedCollection.
	projectClasses size = 1
		ifTrue: [ ^ self newProject: projectClasses first ].
	^ OKNewProjectSelectionDialog openForProjectClasses: projectClasses
]

{ #category : #'project handling' }
OKWorkbenchToolbar class >> newProject: aProjectClass [
	| project projectName |
	projectName := UIManager default request: 'Project name' initialAnswer: 'New Project'.
	(projectName isNil or: [ projectName isEmpty ])
		ifTrue: [ ^ self ].
	project := aProjectClass named: projectName.
	project ifNil: [ ^ self ].
	self loadProject: project
]

{ #category : #'project handling' }
OKWorkbenchToolbar class >> openProject [
	| folder |
	folder := UIManager default chooseDirectory: 'Choose directory containing the project'.
	folder ifNil: [ ^ self ].
	self loadProject: (OKPersistenceProjectReader fromFolder: folder)
]

{ #category : #specs }
OKWorkbenchToolbar class >> projectToolbarMenu: aBuilder [
	<okProjectSubmenu>
	| workbenchToolbar |
	workbenchToolbar := aBuilder model.
	(aBuilder group: #ModelHandling)
		order: 1000;
		with: [ (aBuilder item: 'New model')
				icon: #smallNew asIcon;
				enabledBlock: [ workbenchToolbar projectController isNotNil ];
				action: [ workbenchToolbar openNewModelSelection ] ];
		withSeparatorAfter.
	(aBuilder group: #ProjectHandling)
		order: 2000;
		with: [ (aBuilder item: 'New project')
				icon: #smallOpen asIcon;
				action: [ self newProject ].
			(aBuilder item: 'Open project')
				icon: #smallOpen asIcon;
				action: [ self openProject ].
			(aBuilder item: 'Save project')
				icon: #smallSave asIcon;
				enabledBlock: [ workbenchToolbar projectController isNotNil ];
				action: [ workbenchToolbar projectController saveProject ] ];
		withSeparatorAfter.
	(aBuilder group: #ProjectOptions)
		order: 4000;
		with: [ (aBuilder item: 'Properties...')
				icon: #configuration asIcon;
				enabledBlock: [ workbenchToolbar projectController isNotNil ];
				action: [ workbenchToolbar projectController project maEdit ] ];
		withSeparatorAfter.
	(aBuilder group: #Quit)
		order: 8000;
		with: [ (aBuilder item: 'Exit')
				icon: #smallQuit asIcon;
				action: [ workbenchToolbar workbench delete ] ]
]

{ #category : #initialization }
OKWorkbenchToolbar >> initializePresenter [
	toolbar
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: 'Project';
						icon: #openIcon asIcon;
						subMenu: self projectMenu ] ].
	toolbar applyTo: self
]

{ #category : #initialization }
OKWorkbenchToolbar >> initializeWidgets [
	toolbar := self instantiate: MenuModel
]

{ #category : #specs }
OKWorkbenchToolbar >> openNewModelSelection [
	OKNewModelSelectionDialog openForProjectController: self projectController
]

{ #category : #accessing }
OKWorkbenchToolbar >> project [
	^ self workbench projectController project
]

{ #category : #accessing }
OKWorkbenchToolbar >> projectController [
	^ self workbench projectController
]

{ #category : #'menus for project' }
OKWorkbenchToolbar >> projectMenu [
	| menu builder |
	menu := self instantiate: MenuModel.
	builder := self workbench
		ifNil: [ PragmaMenuBuilder pragmaKeyword: #okProjectSubmenu model: self ]
		ifNotNil: [ OPPragmaPluginMenuBuilder pragmaMultiKeyword: #okProjectSubmenu model: self ].
	menu fromSpec: builder menuSpec.
	^ menu
]

{ #category : #'building widgets' }
OKWorkbenchToolbar >> rebuildWidget [
	self needFullRebuild: false.
	self buildWithSpec
]

{ #category : #accessing }
OKWorkbenchToolbar >> toolbar [
	^ toolbar
]

{ #category : #accessing }
OKWorkbenchToolbar >> workbench [
	^ self owner
]
