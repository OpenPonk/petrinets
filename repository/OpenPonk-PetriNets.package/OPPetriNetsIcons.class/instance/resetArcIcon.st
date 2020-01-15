accessing - icons
resetArcIcon
	"Private - Generated method"

	^ icons
		at: #resetArcIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self resetArcIconContents base64Decoded asByteArray readStream ]