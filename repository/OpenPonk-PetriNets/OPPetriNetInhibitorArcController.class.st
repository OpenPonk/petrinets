"
Controller for Petri Net inhibitor arcs.
Manages diagram lifecycle and interactions for inhibitory connections.
"
Class {
	#name : 'OPPetriNetInhibitorArcController',
	#superclass : 'OPPetriNetArcController',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPPetriNetInhibitorArcController class >> diagramElementClass [

	^ OPPetriNetInhibitorArcShape
]

{ #category : 'accessing' }
OPPetriNetInhibitorArcController class >> viewModelClass [
	^ OPPetriNetInhibitorArcViewModel
]
