private
updateLinksIn: anOpenPonkDiagram
	"update links in anOpenPonkDiagram and then force announcement of updated links if all links in anOpenPonkDiagram were valid before (announcement is not needed if links were not valid before and are not valid even after updating)"

	self
		updateLinksIn: anOpenPonkDiagram
		thenForceAnnounce: (anOpenPonkDiagram links allSatisfy: [ :each | each isValid ])