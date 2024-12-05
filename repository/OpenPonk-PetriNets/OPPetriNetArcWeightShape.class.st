Class {
	#name : 'OPPetriNetArcWeightShape',
	#superclass : 'OPPetriNetArcLabel',
	#category : 'OpenPonk-PetriNets-DiagramElements',
	#package : 'OpenPonk-PetriNets',
	#tag : 'DiagramElements'
}

{ #category : 'as yet unclassified' }
OPPetriNetArcWeightShape >> defaultAnchorConstraintPosition [

	^ OPRSAnchorConstraintBalanceReference balance: 0.7
]

{ #category : 'accessing' }
OPPetriNetArcWeightShape >> defaultText [

	| weight |
	weight := self modelElement weight.
	^ weight = 1
		  ifTrue: [ '' ]
		  ifFalse: [ 'weight: ' , weight asString ]
]
