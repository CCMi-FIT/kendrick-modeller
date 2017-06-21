reading
readProjectFrom: aFile
	| project dom |
	dom := XMLDOMParser parse: aFile readStream.
	project := (dom xPath: '//project/type/text()') first string asClass new.
	project name: (dom xPath: '//project/name/text()') first string.
	project uuid: (UUID fromString: (dom xPath: '//project/uuid/text()') first string).
	project storageFolder: aFile parent.
	^ project