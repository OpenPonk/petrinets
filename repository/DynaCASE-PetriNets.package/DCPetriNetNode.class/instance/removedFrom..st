removing
removedFrom: aDiagram
	super removedFrom: aDiagram do: [ self arcsDo: [ :each | aDiagram remove: each ] ]