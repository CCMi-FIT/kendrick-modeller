api
updateLinksAfterRenamingIn: anOpenPonkDiagram
	"update links in anOpenPonkDiagram and then force announcement of updated links so that new resulting models are generated afterwards"

	self updateLinksIn: anOpenPonkDiagram thenForceAnnounce: true