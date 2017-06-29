api
items: aCollection
	list
		items:
			(aCollection
				collect: [ :each | self listNameFor: each ]);
		whenSelectionIndexChanged: [ :selectedIndex | 
			self
				selected: (aCollection at: selectedIndex);
				delete ]