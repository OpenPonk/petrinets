accessing - icons
arcIcon
	"Private - Generated method"
	^icons 
			at: #arcIcon
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self arcIconContents readStream) ].