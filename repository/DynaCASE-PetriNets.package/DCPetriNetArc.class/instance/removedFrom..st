removing
removedFrom: aDiagram
	self
		removedFrom: aDiagram
		do: [ 
			self
				source: nil;
				target: nil ]