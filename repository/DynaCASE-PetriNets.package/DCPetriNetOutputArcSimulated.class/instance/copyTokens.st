actions
copyTokens
	| weight tokenCount |
	weight := self model weight.
	tokenCount := self source tokenCount.
	self target
		addNewTokens: weight - tokenCount;
		addTokens: ((self source tokens first: (weight min: tokenCount)) collect: [ :each | each copy ])