accessing
target: anObject
	target ifNotNil: [ target removedIncoming: self ].
	super target: anObject.
	target ifNotNil: [ target addedIncoming: self ]