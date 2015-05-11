testing
isEnabled
	"can be fired?"

	^ (incoming allSatisfy: [ :arc | arc isEnabled ]) and: [ outgoing allSatisfy: [ :arc | arc isEnabled ] ]