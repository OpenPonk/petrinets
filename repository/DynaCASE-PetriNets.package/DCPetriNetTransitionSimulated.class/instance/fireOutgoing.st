actions
fireOutgoing
	firing
		ifFalse: [ ^ self ].
	self
		outgoingDo: [ :arc | arc copyTokens ];
		tokensAmount: 0.
	firing := false