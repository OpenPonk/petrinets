accessing
tokens: aNumber
	self assert: aNumber >= 0 description: 'Amount of tokens cannot be negative'.
	tokens := aNumber.
	self changed