Class {
	#name : #OPPetriNetWeightedArcShape,
	#superclass : #OPPetriNetArcShape,
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #creation }
OPPetriNetWeightedArcShape >> createOwnedElementsWithoutController [

	super createOwnedElementsWithoutController.
	OPPetriNetArcWeightShape in: self forModelElement: self modelElement
]
