removing
removedFrom: aDiagram
	self removedFrom: aDiagram do: [ self arcsDo: [ :each | aDiagram remove: each ] ]