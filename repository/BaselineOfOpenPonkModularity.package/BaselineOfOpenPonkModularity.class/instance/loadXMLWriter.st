as yet unclassified
loadXMLWriter
	self halt.
	Metacello new
		baseline: 'XMLWriter';
		repository: 'github://pharo-contributions/XML-XMLWriter:2.9.x/src';
		onConflictUseLoaded;
		lock;
		load