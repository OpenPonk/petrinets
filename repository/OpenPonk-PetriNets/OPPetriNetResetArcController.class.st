Class {
	#name : #OPPetriNetResetArcController,
	#superclass : #OPPetriNetArcController,
	#category : 'OpenPonk-PetriNets-Controllers'
}

{ #category : #hooks }
OPPetriNetResetArcController >> headShapeClass [
	^ OPRTEmptyDoubleArrow

]

{ #category : #accessing }
OPPetriNetResetArcController >> modelClass [
	^ OPPetriNetResetArc
]
