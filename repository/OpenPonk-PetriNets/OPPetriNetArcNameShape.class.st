Class {
	#name : #OPPetriNetArcNameShape,
	#superclass : #OPPetriNetArcLabel,
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #'as yet unclassified' }
OPPetriNetArcNameShape >> defaultAnchorConstraintPosition [

	^ OPRSAnchorConstraintBalanceReference balance: 0.4
]

{ #category : #accessing }
OPPetriNetArcNameShape >> defaultText [

	^ self modelElement name
]
