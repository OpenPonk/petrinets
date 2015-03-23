accessing
target: anObject
	target ifNotNil: [ target removedIncoming: self ].
	target := anObject.
	target ifNotNil: [ target addedIncoming: self ]