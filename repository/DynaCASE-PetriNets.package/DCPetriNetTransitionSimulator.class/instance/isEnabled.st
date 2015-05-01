testing
isEnabled
	"can be fired?"

	^ incoming allSatisfy: [ :arc | arc isEnabled ]