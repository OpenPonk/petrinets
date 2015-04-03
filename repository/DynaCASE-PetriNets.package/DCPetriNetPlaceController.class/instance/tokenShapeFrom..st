accessing
tokenShapeFrom: aNumber
	self tokenCircle
		color:
			(aNumber = 0
				ifTrue: [ Color transparent ]
				ifFalse: [ self defaultColor ]).
	self
		tokenLabel:
			' '
				,
					(aNumber < 2
						ifTrue: [ '' ]
						ifFalse: [ aNumber asString ])