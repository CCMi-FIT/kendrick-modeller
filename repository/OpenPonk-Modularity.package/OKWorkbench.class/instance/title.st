api
title
	^ String
		streamContents: [ :stream | 
			project
				ifNotNil: [ stream
						nextPutAll: project name;
						nextPutAll: ' - ' ].
			stream nextPutAll: 'OpenPonk-Modularity'.
			project
				ifNotNil: [ stream
						nextPutAll: ' for ';
						nextPutAll: project typeName ] ]