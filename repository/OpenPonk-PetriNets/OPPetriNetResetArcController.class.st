Class {
	#name : #OPPetriNetResetArcController,
	#superclass : #OPPetriNetArcController,
	#category : #'OpenPonk-PetriNets-Controllers'
}

{ #category : #construction }
OPPetriNetResetArcController >> diagramElementClass [

	^ OPPetriNetResetArcShape
]

{ #category : #accessing }
OPPetriNetResetArcController >> modelClass [
	^ OPPetriNetResetArc
]
