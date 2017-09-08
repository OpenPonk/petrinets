accessing - icons
petriNetIcon
	"Private - Generated method"
	^icons 
			at: #petriNetIcon
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self petriNetIconContents readStream) ].