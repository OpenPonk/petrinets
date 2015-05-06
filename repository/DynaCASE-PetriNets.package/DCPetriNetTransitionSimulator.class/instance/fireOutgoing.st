actions
fireOutgoing
	firing
		ifFalse: [ ^ self ].
	self outgoingDo: [ :arc | arc handleFire ].
	firing := false