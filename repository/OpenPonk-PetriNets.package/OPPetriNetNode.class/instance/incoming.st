accessing
incoming
	owner ifNil: [ ^ #() ].
	^ owner arcs select: [ :each | each target = self ]