private
applyTokenGroup
	self createTokenGroup.
	tokenGroup view ifNotNil: [ ^ self ].

	TRConstraint stick: tokenGroup onTheCenterOf: self figure.
	self figure view add: tokenGroup.
	self figure addCallback: (TRRemoveCallback block: [ tokenGroup remove ])