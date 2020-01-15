accessing - icons
placeIcon
	"Private - Generated method"

	^ icons
		at: #placeIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self placeIconContents base64Decoded asByteArray readStream ]