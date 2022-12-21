Class {
	#name : #OPPetriNetWeightedArcShape,
	#superclass : #OPPetriNetArcShape,
	#category : #'OpenPonk-PetriNets-DiagramElements'
}

{ #category : #'as yet unclassified' }
OPPetriNetWeightedArcShape >> createOwnedElementsWithoutController [

	super createOwnedElementsWithoutController.
	self ownedElements
		detect: [ :any | any isKindOf: OPPetriNetArcWeightShape ]
		ifFound: [ ^ self ].
	OPPetriNetArcWeightShape in: self forModelElement: self modelElement
]
