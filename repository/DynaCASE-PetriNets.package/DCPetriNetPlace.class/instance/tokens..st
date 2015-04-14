accessing
tokens: aNumber
	aNumber < 0
		ifTrue: [ ^ self error: 'Amount of tokens cannot be negative' ].
	tokens := aNumber.
	self changed