accessing
connected
	owner ifNil: [ ^ #() ].
	^ owner arcs select: [ :each | each source = self or: [ each target = self ] ]