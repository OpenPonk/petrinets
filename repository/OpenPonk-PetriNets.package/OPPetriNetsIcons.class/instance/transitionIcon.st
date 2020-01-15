accessing - icons
transitionIcon
	"Private - Generated method"

	^ icons
		at: #transitionIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self transitionIconContents base64Decoded asByteArray readStream ]