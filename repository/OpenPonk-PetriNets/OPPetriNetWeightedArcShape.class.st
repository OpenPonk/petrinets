Class {
	#name : 'OPPetriNetWeightedArcShape',
	#superclass : 'OPPetriNetArcShape',
	#category : 'OpenPonk-PetriNets-Shapes',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Shapes'
}

{ #category : 'creation' }
OPPetriNetWeightedArcShape >> createOwnedElementsWithoutController [

	self ownedElements ifNotEmpty: [ ^ self ].
	super createOwnedElementsWithoutController.
	OPPetriNetArcWeightShape in: self
]
