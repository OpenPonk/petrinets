"
View model for Petri Net reset arcs.
Handles model attachment logic and provides icons for the UI layer.
"
Class {
	#name : 'OPPetriNetResetArcViewModel',
	#superclass : 'OPPetriNetArcViewModel',
	#category : 'OpenPonk-PetriNets-ViewModels',
	#package : 'OpenPonk-PetriNets',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPPetriNetResetArcViewModel class >> modelClass [ ^ OPPetriNetResetArc
]

{ #category : 'construction' }
OPPetriNetResetArcViewModel >> attachModelFrom: sourceViewModel to: targetViewModel [
	self model source: sourceViewModel model.
	self model target: targetViewModel model.
]

{ #category : 'accessing' }
OPPetriNetResetArcViewModel >> icon [ ^ OPPetriNetsIcons resetArcIcon
]
