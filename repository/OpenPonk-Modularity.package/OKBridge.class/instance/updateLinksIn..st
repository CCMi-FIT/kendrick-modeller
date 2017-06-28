private
updateLinksIn: aDefinitionModel
	"update links in aDefinitionModel and then force announcement of updated links if all links in aDefinitionModel were valid before (announcement is not needed if links were not valid before and are not valid even after updating)"

	self
		updateLinksIn: aDefinitionModel
		thenForceAnnounce: (aDefinitionModel links allSatisfy: [ :each | each isValid ])