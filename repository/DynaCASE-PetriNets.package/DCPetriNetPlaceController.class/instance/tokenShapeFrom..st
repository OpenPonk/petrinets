accessing
tokenShapeFrom: aNumber
	self tokenCircle
		color:
			(aNumber isZero
				ifTrue: [ Color transparent ]
				ifFalse: [ self defaultColor ]).
	self
		tokenLabel:
			' '
				,
					(aNumber < 2
						ifTrue: [ '' ]
						ifFalse: [ aNumber asString ])