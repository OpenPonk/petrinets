accessing
tokenShapeFrom: aNumber
	"updates token shape and label to represent aNumber amount of tokens"

	"lazy initialization of token shape"

	self tokenShape view
		ifNil: [ 
			TRConstraint stick: self tokenShape onTheCenterOf: self figure.
			self figure view add: self tokenShape.
			self figure addCallback: (TRRemoveCallback block: [ tokenShape remove ]).
			self tokenShape addInteraction: tokenLabelInteraction ].

	self tokenShape
		color:
			(aNumber isZero
				ifTrue: [ Color transparent ]
				ifFalse: [ Color black ]).
	self
		tokenText:
			(aNumber < 2
				ifTrue: [ '' ]
				ifFalse: [ aNumber asString ])