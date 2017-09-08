actions
handleFire
	"moves weight amount of tokens between place and transition"

	self source removeTokensAmount: self model weight.
	self target addTokensAmount: self model weight.