private
getResultModelsFrom: aKendrickModel madeFrom: anOpenPonkDiagram
	^ {(OKDummyModel named: aKendrickModel name , '-r1').
	(OKDummyModel named: aKendrickModel name , '-r2')}