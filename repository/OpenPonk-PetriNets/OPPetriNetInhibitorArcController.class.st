Class {
	#name : 'OPPetriNetInhibitorArcController',
	#superclass : 'OPPetriNetArcController',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPPetriNetInhibitorArcController >> diagramElementClass [

	^ OPPetriNetInhibitorArcShape
]

{ #category : 'accessing' }
OPPetriNetInhibitorArcController >> modelClass [
	^ OPPetriNetInhibitorArc
]
