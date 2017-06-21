initialization
initializePresenter
	toolbar
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: 'Project';
						icon: #openIcon asIcon;
						subMenu: self projectMenu ] ].
	toolbar applyTo: self