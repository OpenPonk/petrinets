accessing - icons
inhibitorArcIcon
	"Private - Generated method"

	^ icons
		at: #inhibitorArcIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self inhibitorArcIconContents base64Decoded asByteArray readStream ]