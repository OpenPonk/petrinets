private
tokenGroupFrom: aNumber
	"updates token shape and label to show aNumber amount of tokens"

	self tokenCircle
		color:
			(aNumber isZero
				ifTrue: [ Color transparent ]
				ifFalse: [ Color black ]).
	self
		tokenText:
			(aNumber < 2
				ifTrue: [ '' ]
				ifFalse: [ aNumber asString ]).
	^ self tokenGroup
		translateBy: 0;
		yourself