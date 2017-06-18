opening
closeEditorOf: aModel
	modelspaces at: aModel ifPresent: [ :pair | tabManager removeTab: pair second ].
	aModel announcer unsubscribe: self