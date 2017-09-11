private
tokenGroupFrom: aValue
	self tokenCircle
		color:
			(aValue
				ifNil: [ Color transparent ]
				ifNotNil: [ aValue
						ifTrue: [ Color black ]
						ifFalse: [ Color veryLightGray ] ]).
	self tokenGroup translateBy: 0