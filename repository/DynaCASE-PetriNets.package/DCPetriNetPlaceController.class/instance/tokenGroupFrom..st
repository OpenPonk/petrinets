private
tokenGroupFrom: aNumber
	"updates token shape and label to represent aNumber amount of tokens"

	self tokenCircle
		color:
			(aNumber isZero
				ifTrue: [ Color transparent ]
				ifFalse: [ Color black ]).
	self
		tokenText:
			(aNumber < 2
				ifTrue: [ '' ]
				ifFalse: [ aNumber asString ])