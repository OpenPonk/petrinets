"
Abstract diagram element representing a weighted arc in a Petri Net.
Manages rendering logic for weight labels on its underlying Roassal shape.
"
Class {
	#name : 'OPPetriNetWeightedArcShape',
	#superclass : 'OPPetriNetArcShape',
	#category : 'OpenPonk-PetriNets-DiagramElements',
	#package : 'OpenPonk-PetriNets',
	#tag : 'DiagramElements'
}

{ #category : 'initialization' }
OPPetriNetWeightedArcShape >> createOwnedElementsWithoutController [

	self ownedElements ifNotEmpty: [ ^ self ].
	super createOwnedElementsWithoutController.
	OPPetriNetArcWeightShape in: self
]
