accessing
selected: aPlugin
	^ (UIManager default request: 'Model name' initialAnswer: aPlugin name)
		ifNotNil: [ :filledName | 
			| aDiagram |
			aDiagram := aPlugin modelClass named: filledName.
			self project addModel: aDiagram.
			self projectController openAllDiagrams ]