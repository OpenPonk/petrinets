accessing
source: anObject
	source ifNotNil: [ source removedOutgoing: self ].
	super source: anObject.
	source ifNotNil: [ source addedOutgoing: self ]