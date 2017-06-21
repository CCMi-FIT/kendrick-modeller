private
updateLinksIn: anOpenPonkDiagram
	self
		updateLinksIn: anOpenPonkDiagram
		thenAnnounce: (anOpenPonkDiagram links allSatisfy: [ :each | each isValid ])