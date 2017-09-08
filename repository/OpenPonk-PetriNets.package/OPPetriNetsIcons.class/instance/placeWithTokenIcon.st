accessing - icons
placeWithTokenIcon
	"Private - Generated method"
	^icons 
			at: #placeWithTokenIcon
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self placeWithTokenIconContents readStream) ].