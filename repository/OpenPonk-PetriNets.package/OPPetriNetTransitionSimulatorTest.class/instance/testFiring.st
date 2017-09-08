tests
testFiring
	self assert: inc tokensAmount = 4.
	self assert: out tokensAmount = 4.
	simulator fireIncoming.
	self assert: inc tokensAmount = 3.
	self assert: out tokensAmount = 4.
	simulator fireOutgoing.
	self assert: inc tokensAmount = 3.
	self assert: out tokensAmount = 5.
	simulator doAction: 1.
	self assert: inc tokensAmount = 2.
	self assert: out tokensAmount = 5.
	simulator doAction: 2.
	self assert: inc tokensAmount = 2.
	self assert: out tokensAmount = 6.
	simulator step.
	self assert: inc tokensAmount = 1.
	self assert: out tokensAmount = 7