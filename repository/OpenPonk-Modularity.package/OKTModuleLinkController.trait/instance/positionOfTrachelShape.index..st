figures
positionOfTrachelShape: trachelShape index: index
	"compute a position of fixed shape on canvas if it is on index position amongst all other module links"

	^ (trachelShape height / 2 * index + (trachelShape width * (index - (1 / 2))))
		@ trachelShape height