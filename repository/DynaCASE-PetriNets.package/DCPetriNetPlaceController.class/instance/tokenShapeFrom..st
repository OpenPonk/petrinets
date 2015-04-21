accessing
tokenShapeFrom: aNumber
	self tokenShape view
		ifNil: [ 
			TRConstraint stick: self tokenShape onTheCenterOf: self figure.
			self figure view add: self tokenShape.
			self tokenShape addInteraction: tokenLabelInteraction ].
	self tokenShape
		color:
			(aNumber isZero
				ifTrue: [ Color transparent ]
				ifFalse: [ self defaultColor ]).
	self
		tokenText:
			(aNumber < 2
				ifTrue: [ '' ]
				ifFalse: [ aNumber asString ])