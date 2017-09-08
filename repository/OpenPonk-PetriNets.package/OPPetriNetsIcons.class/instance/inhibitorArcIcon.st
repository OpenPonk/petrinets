accessing - icons
inhibitorArcIcon
	"Private - Generated method"
	^icons 
			at: #inhibitorArcIcon
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self inhibitorArcIconContents readStream) ].