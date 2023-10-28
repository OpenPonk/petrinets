Class {
	#name : #OPPetriNetWeightedArcShape,
	#superclass : #OPPetriNetArcShape,
	#category : #'OpenPonk-PetriNets-Shapes'
}

{ #category : #creation }
OPPetriNetWeightedArcShape >> createOwnedElementsWithoutController [

	self ownedElements ifNotEmpty: [ ^ self ].
	super createOwnedElementsWithoutController.
	OPPetriNetArcWeightShape in: self
]
