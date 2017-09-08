tests
testSteppable
	self assert: simulator isSimulable.
	self assert: simulator isSteppable.
	self assert: simulator isEnabled