private
createTokenGroup
	| circle |
	tokenGroup ifNotNil: [ ^ self ].
	circle := RTEllipse new
		size: 12;
		color: Color black;
		elementOn: ''.
	tokenGroup := RTGroup with: circle