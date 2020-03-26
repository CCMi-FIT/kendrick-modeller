"
I am an modification of OpenPonk project directory persistence handler class and I am here to allow some of the features of OpenPonk modularity tool.
"
Class {
	#name : #OKProjectDirectoryPersistence,
	#superclass : #OPProjectDirectoryPersistence,
	#category : 'OpenPonk-Modularity-Persistence'
}

{ #category : #accessing }
OKProjectDirectoryPersistence >> exporter [
	^ 'OpenPonk-Kendrick-modularity Tool'
]

{ #category : #writing }
OKProjectDirectoryPersistence >> writeProject: aProject on: aStream [
	(XMLWriter on: aStream)
		writeWith: [ :writer | 
			writer
				enablePrettyPrinting;
				xml;
				tag: 'project'
					with: [ writer
						tag: 'type' with: aProject className;
						tag: 'name' with: aProject name;
						tag: 'uuid' with: aProject uuid asString;
						tag: 'documentation'
							with: [ writer
								tag: 'exporter' with: self exporter;
								tag: 'exporterVersion' with: self exporterVersion;
								tag: 'timestamp' with: DateAndTime now truncated asString ] ] ]
]
