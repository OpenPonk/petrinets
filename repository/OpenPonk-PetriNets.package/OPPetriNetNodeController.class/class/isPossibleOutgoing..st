testing
isPossibleOutgoing: aController
	PossibleOutgoing ifNil: [ self initializePossibleConnected ].
	^ PossibleOutgoing includes: aController