accessing
focusView: anInteger
	(tabManager tabs at: anInteger ifAbsent: [ ^ self ]) selected: true