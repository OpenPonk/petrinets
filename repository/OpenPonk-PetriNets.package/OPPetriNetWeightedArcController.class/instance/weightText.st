accessing
weightText
	"gets weight from model and transforms it into string"

	| weight |
	weight := self model weight.
	^ weight = 1
		ifTrue: [ '' ]
		ifFalse: [ 'weight: ' , weight asString ]