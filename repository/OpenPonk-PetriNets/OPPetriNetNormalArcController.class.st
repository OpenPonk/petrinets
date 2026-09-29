"
Controller for Petri Net normal arcs.
Manages diagram lifecycle and interactions for standard weighted input/output arcs.
"
Class {
	#name : 'OPPetriNetNormalArcController',
	#superclass : 'OPPetriNetWeightedArcController',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPPetriNetNormalArcController class >> diagramElementClass [

	^ OPPetriNetNormalArcShape
]

{ #category : 'accessing' }
OPPetriNetNormalArcController class >> viewModelClass [
	^ OPPetriNetNormalArcViewModel
]
