figures
positionOfTrachelShape: trachelShape index: index
	^ (trachelShape height / 2 * index + (trachelShape width * (index - (1 / 2))))
		@ trachelShape height