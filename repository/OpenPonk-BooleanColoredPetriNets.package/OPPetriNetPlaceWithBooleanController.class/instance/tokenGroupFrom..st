private
tokenGroupFrom: aValue
	self tokenCircle
		color:
			(aValue
				ifNil: [ Color transparent ]
				ifNotNil: [ aValue
						ifTrue: [ Color black ]
						ifFalse: [ Color fromString: '#F0F0F0' ] ]).
	(aValue isNil or: [ aValue ])
		ifTrue: [ self tokenCircle trachelShape noBorder ]
		ifFalse: [ self tokenCircle trachelShape
				strokePaint: (Color fromString: '#303030') ].
	^ self tokenGroup
		translateBy: 0;
		yourself