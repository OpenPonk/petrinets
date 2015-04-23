actions
moveTokens
	| weight |
	weight := self model weight.
	self source removeTokensAmount: weight.
	self target addTokensAmount: weight