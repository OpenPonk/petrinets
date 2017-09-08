tests
testLoadingState
	self assert: model tokens = 20.
	self assert: simulator tokensAmount = 20.
	simulator saveState.
	self assert: model tokens = 20.
	self assert: simulator tokensAmount = 20.


	simulator removeTokensAmount: 5.
	self assert: model tokens = 15.

	simulator tokensAmount: 0.
	self assert: model tokens = 0.

	simulator loadState.
	self assert: model tokens = 20.
	self assert: simulator tokensAmount = 20