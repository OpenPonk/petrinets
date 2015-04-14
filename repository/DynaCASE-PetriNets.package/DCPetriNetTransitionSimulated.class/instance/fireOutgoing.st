actions
fireOutgoing
	firing
		ifFalse: [ ^ self ].
	self
		outgoingDo: [ :arc | arc copyTokens ];
		removeAllTokens.
	firing := false