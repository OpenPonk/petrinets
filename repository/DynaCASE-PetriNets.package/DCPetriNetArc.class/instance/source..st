accessing
source: anObject
	source ifNotNil: [ source removedOutgoing: self ].
	source := anObject.
	source ifNotNil: [ source addedOutgoing: self ]