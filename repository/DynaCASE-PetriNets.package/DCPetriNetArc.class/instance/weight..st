accessing
weight: anInteger
	self assert: anInteger > 0 description: 'Weight must be positive'.
	weight := anInteger.
	self changed