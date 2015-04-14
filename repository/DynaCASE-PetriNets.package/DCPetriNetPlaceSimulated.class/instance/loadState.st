actions
loadState
	self
		removeTokens: model tokens - startingModel tokens;
		addNewTokens: startingModel tokens - model tokens