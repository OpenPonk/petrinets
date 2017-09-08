accessing
outgoing
	owner ifNil: [ ^ #() ].
	^ owner arcs select: [ :each | each source = self ]