testing
isEnabled
	"are conditions for firing met on this arc? - is there at least weight amount of tokens in place?"

	^ self source tokensAmount >= self model weight