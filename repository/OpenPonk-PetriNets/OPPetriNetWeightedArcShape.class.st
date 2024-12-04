Class {
	#name : 'OPPetriNetWeightedArcShape',
	#superclass : 'OPPetriNetArcShape',
	#category : 'OpenPonk-PetriNets-DiagramElements',
	#package : 'OpenPonk-PetriNets',
	#tag : 'DiagramElements'
}

{ #category : 'creation' }
OPPetriNetWeightedArcShape >> createOwnedElementsWithoutController [

	self ownedElements ifNotEmpty: [ ^ self ].
	super createOwnedElementsWithoutController.
	OPPetriNetArcWeightShape in: self
]
