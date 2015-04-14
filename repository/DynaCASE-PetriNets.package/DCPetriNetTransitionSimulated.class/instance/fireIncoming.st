actions
fireIncoming
	self fireable
		ifFalse: [ ^ self ].
	firing := true.
	self incomingDo: [ :arc | arc moveTokens ]