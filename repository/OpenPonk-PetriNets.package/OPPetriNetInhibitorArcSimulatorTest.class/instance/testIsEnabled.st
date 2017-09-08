tests
testIsEnabled
	self assert: simulator isEnabled not.
	place tokensAmount: 0.
	self assert: simulator isEnabled.
	place tokensAmount: 1000.
	self assert: simulator isEnabled not