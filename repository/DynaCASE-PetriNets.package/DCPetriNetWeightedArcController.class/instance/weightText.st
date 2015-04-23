accessing
weightText
	| weight |
	weight := self model weight.
	^ weight = 1
		ifTrue: [ '' ]
		ifFalse: [ 'weight: ' , weight asString ]