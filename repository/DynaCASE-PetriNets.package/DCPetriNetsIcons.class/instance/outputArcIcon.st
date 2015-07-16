accessing - icons
outputArcIcon
	"Private - Generated method"
	^icons 
			at: #outputArcIcon
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self outputArcIconContents readStream) ].