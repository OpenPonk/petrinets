private
applyTokenGroup
	self createTokenGroup.
	Transcript show: model printString; show: ' - '; show: (tokenGroup view ifNil: ['nil'] ifNotNil: ['view']); cr.
	tokenGroup view ifNotNil: [ ^ self ].
	(RTConstraint on: tokenGroup background: self figure)
		center;
		stick.
	self figure view add: tokenGroup.
	self figure addCallback: (TRRemoveCallback block: [ tokenGroup remove ])