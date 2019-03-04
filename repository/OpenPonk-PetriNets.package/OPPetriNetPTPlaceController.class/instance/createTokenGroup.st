private
createTokenGroup
	| label |
	tokenGroup ifNotNil: [ ^ self ].
	super createTokenGroup.
	label := RTLabel new
		color: Color black;
		text: '';
		element.
	tokenGroup := RTGroup with: label with: tokenGroup first.
	RTConstraint stick: label onTheLeftOf: tokenGroup second