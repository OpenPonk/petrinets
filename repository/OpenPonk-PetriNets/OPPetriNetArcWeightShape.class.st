"
Diagram element representing an arc weight label in a Petri Net.
Manages anchoring position and weight value rendering along the arc.
"
Class {
	#name : 'OPPetriNetArcWeightShape',
	#superclass : 'OPPetriNetArcLabel',
	#category : 'OpenPonk-PetriNets-DiagramElements',
	#package : 'OpenPonk-PetriNets',
	#tag : 'DiagramElements'
}

{ #category : 'adding' }
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
