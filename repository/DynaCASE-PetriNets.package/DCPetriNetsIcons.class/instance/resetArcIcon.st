accessing - icons
resetArcIcon
	"Private - Generated method"
	^icons 
			at: #resetArcIcon
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self resetArcIconContents readStream) ].