accessing
weight: anInteger
	"amount of tokens moved when fired"

	self assert: anInteger > 0 description: 'Weight must be positive'.
	weight := anInteger.
	self changed