as yet unclassified
loadXMLWriter
	Metacello new
		baseline: 'XMLWriter';
		repository: 'github://pharo-contributions/XML-XMLWriter:2.9.x/src';
		onConflict: [ :err | err useLoaded ];
		load