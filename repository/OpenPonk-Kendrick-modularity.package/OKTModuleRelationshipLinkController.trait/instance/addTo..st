adding
addTo: aDiagramController
	(aDiagramController controllerForLinkedModel: self linkedModel source)
		addAsSourceFor: self.
	(aDiagramController controllerForLinkedModel: self linkedModel target)
		addAsTargetFor: self