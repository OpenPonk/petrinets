removing
removedFrom: aDiagram
	self
		removedFrom: aDiagram
		do: [ 
			self source removedOutgoing: self.
			self target removedIncoming: self ]