accessing
tokens: aNumber
	"sets amount of tokens to aNumber"

	self assert: aNumber >= 0 description: 'Amount of tokens cannot be negative'.
	tokens := aNumber.
	self announce: (OPPlaceTokensChanged element: self)