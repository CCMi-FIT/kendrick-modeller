private
updateLinksIn: anOpenPonkDiagram thenForceAnnounce: forceAnnounce
	"this methods updates all links in anOpenPonkDiagram to point to current resulting models or to point to broken references if there are no proper model objects to link to"

	self
		updateModuleLinksIn: anOpenPonkDiagram;
		updateElementLinksIn: anOpenPonkDiagram.

	"if asked for, or if new model has all links valid, notify anOpenPonkDiagram that links have been updated to that is can react to it and notify that it needs to generate new resulting models"
	(forceAnnounce or: [ anOpenPonkDiagram links allSatisfy: [ :each | each isValid ] ])
		ifTrue: [ anOpenPonkDiagram linksUpdated ]