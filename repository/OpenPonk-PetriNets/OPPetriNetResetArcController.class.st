"
Controller for Petri Net reset arcs.
Manages diagram lifecycle and valid connection constraints for reset connections.
"
Class {
	#name : 'OPPetriNetResetArcController',
	#superclass : 'OPPetriNetArcController',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPPetriNetResetArcController class >> diagramElementClass [

	^ OPPetriNetResetArcShape
]

{ #category : 'accessing' }
OPPetriNetResetArcController class >> viewModelClass [
	^ OPPetriNetResetArcViewModel
]
