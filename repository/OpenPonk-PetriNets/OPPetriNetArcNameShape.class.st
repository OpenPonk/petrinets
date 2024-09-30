Class {
	#name : 'OPPetriNetArcNameShape',
	#superclass : 'OPPetriNetArcLabel',
	#category : 'OpenPonk-PetriNets-Shapes',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Shapes'
}

{ #category : 'as yet unclassified' }
OPPetriNetArcNameShape >> defaultAnchorConstraintPosition [

	^ OPRSAnchorConstraintBalanceReference balance: 0.4
]

{ #category : 'accessing' }
OPPetriNetArcNameShape >> defaultText [

	^ self modelElement name
]
