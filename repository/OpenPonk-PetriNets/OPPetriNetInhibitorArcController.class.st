Class {
	#name : #OPPetriNetInhibitorArcController,
	#superclass : #OPPetriNetArcController,
	#category : 'OpenPonk-PetriNets-Controllers'
}

{ #category : #hooks }
OPPetriNetInhibitorArcController >> headShapeClass [
	^ RTEmptyCircle
]

{ #category : #accessing }
OPPetriNetInhibitorArcController >> modelClass [
	^ OPPetriNetInhibitorArc
]
