Class {
	#name : 'OPPetriNetResetArcController',
	#superclass : 'OPPetriNetArcController',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPPetriNetResetArcController >> diagramElementClass [

	^ OPPetriNetResetArcShape
]

{ #category : 'accessing' }
OPPetriNetResetArcController >> modelClass [
	^ OPPetriNetResetArc
]
