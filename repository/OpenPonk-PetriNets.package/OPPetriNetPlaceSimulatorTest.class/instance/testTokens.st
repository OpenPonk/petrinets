tests
testTokens
	self assert: simulator tokenCount = 0.
	self assert: simulator tokensAmount = 20.
	simulator removeTokensAmount: 5.
	self assert: simulator tokensAmount = 15.
	simulator tokensAmount: 0.
	self assert: simulator tokensAmount = 0.
	simulator addTokensAmount: 5.
	self assert: simulator tokensAmount = 5