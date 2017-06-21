accessing
persistenceManager
	^ persistenceManager ifNil: [ persistenceManager := OKProjectDirectoryPersistence new ]