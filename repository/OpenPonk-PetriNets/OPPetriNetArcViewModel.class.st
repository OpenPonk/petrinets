"
Abstract view model for Petri Net arcs. Provides icons and model attachment logic for the UI layer.
"
Class {
	#name : 'OPPetriNetArcViewModel',
	#superclass : 'OPDirectedAssociationViewModel',
	#category : 'OpenPonk-PetriNets-ViewModels',
	#package : 'OpenPonk-PetriNets',
	#tag : 'ViewModels'
}

{ #category : 'testing' }
OPPetriNetArcViewModel class >> isAbstract [

	^ self = OPPetriNetArcViewModel
]

{ #category : 'accessing' }
OPPetriNetArcViewModel >> icon [ ^ OPPetriNetsIcons arcIcon
]
