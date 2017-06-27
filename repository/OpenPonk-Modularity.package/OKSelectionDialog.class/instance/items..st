api
items: aCollection
	list
		items:
			(aCollection
				collect: [ :each | each asString ]);
		whenSelectionIndexChanged: [ :selectedIndex | 
			self
				selected: (aCollection at: selectedIndex);
				delete ]