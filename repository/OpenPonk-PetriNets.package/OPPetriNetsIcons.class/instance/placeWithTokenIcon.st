accessing - icons
placeWithTokenIcon
	"Private - Generated method"

	^ icons
		at: #placeWithTokenIcon
		ifAbsentPut: [ Form
				fromBinaryStream:
					self placeWithTokenIconContents base64Decoded asByteArray readStream ]