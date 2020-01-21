Class {
	#name : #OPPetriNetNormalArcController,
	#superclass : #OPPetriNetWeightedArcController,
	#category : 'OpenPonk-PetriNets-Controllers'
}

{ #category : #hooks }
OPPetriNetNormalArcController >> headShapeClass [
	^ RTSimpleArrow
]

{ #category : #accessing }
OPPetriNetNormalArcController >> modelClass [
	^ OPPetriNetNormalArc
]
