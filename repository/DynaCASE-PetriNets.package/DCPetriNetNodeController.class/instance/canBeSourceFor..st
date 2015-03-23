testing
canBeSourceFor: aController
	^ (self canBeSourceFor anySatisfy: [ :any | aController isKindOf: any ]) and: (aController isLinkedWithKind: self) not