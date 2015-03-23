removing
removedFrom: aDiagram
	super
		removedFrom: aDiagram
		do: [ 
			self source: nil.
			self target: nil ]