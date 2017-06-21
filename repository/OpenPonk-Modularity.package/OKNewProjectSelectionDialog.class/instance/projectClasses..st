accessing
projectClasses: projectClasses
	list
		items: (projectClasses collect: [ :each | each name ]);
		whenSelectionIndexChanged: [ :selectedIndex | 
			self
				selected: (projectClasses at: selectedIndex);
				delete ]