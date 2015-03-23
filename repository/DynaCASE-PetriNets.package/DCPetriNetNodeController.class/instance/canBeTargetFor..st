testing
canBeTargetFor: aController
	^ (self canBeTargetFor anySatisfy: [ :any | aController isKindOf: any ]) and: (aController isLinkedWithKind: self) not