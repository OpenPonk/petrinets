accessing - icons
petriNetIcon
	"Private - Generated method"

	^ icons
		at: #petriNetIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self petriNetIconContents base64Decoded asByteArray readStream ]