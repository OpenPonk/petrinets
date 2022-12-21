Class {
	#name : #OPPetriNetNormalArcController,
	#superclass : #OPPetriNetWeightedArcController,
	#category : #'OpenPonk-PetriNets-Controllers'
}

{ #category : #construction }
OPPetriNetNormalArcController >> diagramElementClass [

	^ OPPetriNetNormalArcShape
]

{ #category : #accessing }
OPPetriNetNormalArcController >> modelClass [
	^ OPPetriNetNormalArc
]
