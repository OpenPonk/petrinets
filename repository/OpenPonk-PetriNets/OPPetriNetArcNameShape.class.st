"
Diagram element representing an arc name label in a Petri Net.
Manages anchoring position and textual rendering along the arc.
"
Class {
	#name : 'OPPetriNetArcNameShape',
	#superclass : 'OPPetriNetArcLabel',
	#category : 'OpenPonk-PetriNets-DiagramElements',
	#package : 'OpenPonk-PetriNets',
	#tag : 'DiagramElements'
}

{ #category : 'adding' }
OPPetriNetArcNameShape >> defaultAnchorConstraintPosition [

	^ OPRSAnchorConstraintBalanceReference balance: 0.4
]

{ #category : 'accessing' }
OPPetriNetArcNameShape >> defaultText [

	^ self modelElement name
]
