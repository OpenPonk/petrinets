actions
moveTokens
	"moves weight amount of tokens from place into transition"

	| weight |
	weight := self model weight.
	self source removeTokensAmount: weight.
	self target addTokensAmount: weight