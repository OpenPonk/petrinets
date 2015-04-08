removing
removedFrom: aDiagram
	self
		removedFrom: aDiagram
		do: [ 
			self source: nil.
			self target: nil ]