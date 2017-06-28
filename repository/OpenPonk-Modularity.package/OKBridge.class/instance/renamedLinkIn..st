private
renamedLinkIn: aDefinitionModel
	"call this if a link in aDefinitionModel gets renamed by the user"

	self updateLinksIn: aDefinitionModel thenForceAnnounce: true