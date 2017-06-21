specs
projectToolbarMenu: aBuilder
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