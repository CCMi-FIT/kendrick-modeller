figures
positionOfTrachelShape: trachelShape index: index
	^ (trachelShape canvas extent x - ((trachelShape height + trachelShape width) / 2))
		@ trachelShape height