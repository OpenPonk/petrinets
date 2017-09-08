testing
canBeTargetFor: aController
	^ (aController isKindOf: OPPetriNetArcController) and: [ self class ~= aController source class ]