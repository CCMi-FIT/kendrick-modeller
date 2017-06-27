accessing
name: aString
	"this is, in fact, not renaming of the link, but pointing to an element with given name"

	self
		linkedModel: (OKNamedBrokenReference named: aString);
		linkRenamed