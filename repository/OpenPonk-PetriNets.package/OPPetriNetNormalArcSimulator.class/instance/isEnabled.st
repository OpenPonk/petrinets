testing
isEnabled
	"are conditions for firing met on this arc? - is there at least weight amount of tokens in place?"

	^ (self source canSendTokens: self model weight)
		and: [ self target canReceiveTokens: self model weight ]