writing
writeProject: aProject on: aStream
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