testing
isPossibleIncoming: aController
	PossibleIncoming ifNil: [ self initializePossibleConnected ].
	^ PossibleIncoming includes: aController