"
View model for Petri Net inhibitor arcs.
Handles model attachment logic between a place and a transition, and provides icons for the UI layer.
"
Class {
	#name : 'OPPetriNetInhibitorArcViewModel',
	#superclass : 'OPPetriNetArcViewModel',
	#category : 'OpenPonk-PetriNets-ViewModels',
	#package : 'OpenPonk-PetriNets',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPPetriNetInhibitorArcViewModel class >> modelClass [ ^ OPPetriNetInhibitorArc
]

{ #category : 'construction' }
OPPetriNetInhibitorArcViewModel >> attachModelFrom: sourceViewModel to: targetViewModel [
	self model source: sourceViewModel model.
	self model target: targetViewModel model.
]

{ #category : 'accessing' }
OPPetriNetInhibitorArcViewModel >> icon [ ^ OPPetriNetsIcons inhibitorArcIcon
]
