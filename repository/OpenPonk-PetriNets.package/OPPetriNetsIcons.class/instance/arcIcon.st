accessing - icons
arcIcon
	"Private - Generated method"

	^ icons
		at: #arcIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self arcIconContents base64Decoded asByteArray readStream ]