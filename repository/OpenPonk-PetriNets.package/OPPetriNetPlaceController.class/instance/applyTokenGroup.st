private
applyTokenGroup
	self createTokenGroup.
	tokenGroup view ifNotNil: [ ^ self ].
	(RTConstraint on: tokenGroup background: self figure)
		center;
		stick.
	self figure view add: tokenGroup.
	self figure addCallback: (TRRemoveCallback block: [ tokenGroup remove ])