accessing - icons
placeIcon
	"Private - Generated method"
	^icons 
			at: #placeIcon
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self placeIconContents readStream) ].