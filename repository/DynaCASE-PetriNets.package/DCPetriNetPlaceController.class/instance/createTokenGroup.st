private
createTokenGroup
	| label circle |
	tokenGroup ifNotNil: [ ^ self ].

	label := RTLabel new
		color: Color black;
		text: '';
		element.
	circle := RTEllipse new
		size: 12;
		color: Color black;
		elementOn: ''.
	tokenGroup := RTGroup with: label with: circle.
	TRConstraint stick: label onTheLeftOf: circle