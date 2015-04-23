actions
fireIncoming
	self isEnabled
		ifFalse: [ ^ self ].
	firing := true.
	self incomingDo: [ :arc | arc moveTokens ]