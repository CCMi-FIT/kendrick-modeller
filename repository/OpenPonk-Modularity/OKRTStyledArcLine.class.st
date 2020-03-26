"
I am an modification of OpenPonk-Roassal ArcLine and I enable styling of the line.
"
Class {
	#name : #OKRTStyledArcLine,
	#superclass : #OPRTArcLine,
	#instVars : [
		'dashes'
	],
	#category : 'OpenPonk-Modularity-Roassal2'
}

{ #category : #rendering }
OKRTStyledArcLine >> arcShapeFor: anEdge [
	| shape |
	shape := OKTRStyledArcShape new.
	shape
		width: width;
		radius: radius;
		from: (attachPoint startingPointOf: anEdge) to: (attachPoint endingPointOf: anEdge);
		color: (self colorFor: anEdge);
		dashes: dashes.
	^ shape
]

{ #category : #accessing }
OKRTStyledArcLine >> dashes [
	^ dashes
]

{ #category : #'line styles' }
OKRTStyledArcLine >> dottedLine [
	dashes := #("fill" 1 "gap" 2)
]
