testing
isLinkedWithKind: aController
	| res |
	res := false.
	source ifNotNil: [ res := source sameKindAs: aController ].
	target ifNotNil: [ res := res or: (target sameKindAs: aController) ].
	^ res