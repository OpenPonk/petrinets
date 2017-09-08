tests
testHandleFire
	self assert: place tokensAmount = 10.
	simulator handleFire.
	self assert: place tokensAmount = 10