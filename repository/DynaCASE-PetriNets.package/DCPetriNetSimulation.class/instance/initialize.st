initialization
initialize
	super initialize.
	self
		addAction: [ 
			self simulableElementsDo: [ :el | el fireIncoming ].
			self simulableElementsDo: [ :el | el fireOutgoing ] ]