private
updateLinksIn: anOpenPonkDiagram
	self
		updateLinksIn: anOpenPonkDiagram
		thenForceAnnounce: (anOpenPonkDiagram links allSatisfy: [ :each | each isValid ])