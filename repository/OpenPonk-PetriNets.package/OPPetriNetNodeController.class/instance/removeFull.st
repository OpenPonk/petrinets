removing
removeFull
	self model connected asSet
		do: [ :each | (self diagramController controllerForModel: each) removeFull ].
	super removeFull