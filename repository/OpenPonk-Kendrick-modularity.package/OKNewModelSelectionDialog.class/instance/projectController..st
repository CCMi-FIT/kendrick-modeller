accessing
projectController: aProjectController
	| enabledPlugins |
	projectController := aProjectController.
	enabledPlugins := self enabledPlugins.
	list
		items: (enabledPlugins collect: [ :each | each name ]);
		whenSelectionIndexChanged: [ :selectedIndex | 
			self
				selected: (enabledPlugins at: selectedIndex);
				delete ]