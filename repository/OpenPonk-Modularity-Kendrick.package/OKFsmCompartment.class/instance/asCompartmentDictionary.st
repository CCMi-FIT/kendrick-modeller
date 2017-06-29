accessing
asCompartmentDictionary
	"I will return Kendrick-friendly dictionary of my parts. If I was combined as state 'X' and specie 'A', I will return dictionary {#state->'X'. #species->'A'} asDictionary."

	^ Dictionary new , (parts collect: [ :each | each asCompartmentDictionary ])