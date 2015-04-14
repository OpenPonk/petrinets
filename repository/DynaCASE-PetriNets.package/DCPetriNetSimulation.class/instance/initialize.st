initialization
initialize
	super initialize.
	self
		addAction: [ 
			self simulatedElementsDo: [ :el | el fireIncoming ].
			self simulatedElementsDo: [ :el | el fireOutgoing ] ]