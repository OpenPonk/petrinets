accessing - icons
transitionIcon
	"Private - Generated method"
	^icons 
			at: #transitionIcon
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self transitionIconContents readStream) ].