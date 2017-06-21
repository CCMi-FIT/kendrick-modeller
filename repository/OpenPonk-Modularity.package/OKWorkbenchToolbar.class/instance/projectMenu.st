menus for project
projectMenu
	| menu builder |
	menu := self instantiate: MenuModel.
	builder := self workbench
		ifNil: [ PragmaMenuBuilder pragmaKeyword: #okProjectSubmenu model: self ]
		ifNotNil: [ OPPragmaPluginMenuBuilder pragmaMultiKeyword: #okProjectSubmenu model: self ].
	menu fromSpec: builder menuSpec.
	^ menu