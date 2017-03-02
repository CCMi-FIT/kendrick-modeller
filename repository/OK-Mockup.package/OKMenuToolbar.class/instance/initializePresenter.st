initialization
initializePresenter
	toolbar
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: 'Project';
						icon: Smalltalk ui icons openIcon;
						subMenu: self projectMenu ];
				addItem: [ :item | 
					item
						name: 'View';
						icon: (Smalltalk ui icons iconNamed: #image);
						subMenu: self projectMenu ] ].
	toolbar applyTo: self