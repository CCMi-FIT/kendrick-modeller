"
I am an modification of OpenPonk-Trachel ArcLine and I enable styling of the line.
"
Class {
	#name : #OKTRStyledArcShape,
	#superclass : #OPTRArcShape,
	#instVars : [
		'dashes',
		'capStyle'
	],
	#category : #'Kendrick-Modeller-Core-Roassal2'
}

{ #category : #accessing }
OKTRStyledArcShape >> capStyle [
	^ capStyle ifNil: [ #capButt ]
]

{ #category : #accessing }
OKTRStyledArcShape >> capStyle: aStyle [
	self
		assert: [ aStyle isNil
				or: [ #(#capRound #capButt #capSquare) includes: aStyle ] ].
	capStyle := aStyle
]

{ #category : #accessing }
OKTRStyledArcShape >> dashes: anArrayOfNumeric [
	dashes := anArrayOfNumeric
]

{ #category : #drawing }
OKTRStyledArcShape >> drawOn: athensCanvas [
	athensCanvas pathTransform
		restoreAfter: [ athensCanvas setShape: self path.
			(athensCanvas setStrokePaint: color)
				width: 1;
				perform: self capStyle;
				dashes: dashes offset: 0.
			athensCanvas draw ]
]
