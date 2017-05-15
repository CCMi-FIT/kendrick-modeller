specs
projectToolbarMenu: aBuilder
	<okProjectSubmenu>
	| workbenchToolbar |
	workbenchToolbar := aBuilder model.
	(aBuilder group: #ModelHandling)
		order: 1000;
		with: [ (aBuilder item: 'New model')
				icon: Smalltalk ui icons smallNew;
				enabledBlock: [ workbenchToolbar projectController isNotNil ];
				action: [ workbenchToolbar openNewModelSelection ] ];
		withSeparatorAfter.
	(aBuilder group: #ProjectHandling)
		order: 2000;
		with: [ (aBuilder item: 'New project')
				icon: Smalltalk ui icons smallOpen;
				action: [ self newProject ].
			(aBuilder item: 'Open project')
				icon: Smalltalk ui icons smallOpen;
				action: [ self openProject ].
			(aBuilder item: 'Save project')
				icon: Smalltalk ui icons smallSave;
				enabledBlock: [ workbenchToolbar projectController isNotNil ];
				action: [ workbenchToolbar projectController saveProject ] ];
		withSeparatorAfter.
	(aBuilder group: #ProjectOptions)
		order: 4000;
		with: [ (aBuilder item: 'Properties...')
				icon: Smalltalk ui icons configuration;
				enabledBlock: [ workbenchToolbar projectController isNotNil ];
				action: [ workbenchToolbar projectController project maEdit ] ];
		withSeparatorAfter.
	(aBuilder group: #Quit)
		order: 8000;
		with: [ (aBuilder item: 'Exit')
				icon: Smalltalk ui icons smallQuit;
				action: [ workbenchToolbar workbench delete ] ]