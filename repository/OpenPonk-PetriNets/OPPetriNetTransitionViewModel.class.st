"
View model for Petri Net transitions.
Provides icons and structural mappings to the workbench without GUI dependencies.
"
Class {
	#name : 'OPPetriNetTransitionViewModel',
	#superclass : 'OPPetriNetNodeViewModel',
	#category : 'OpenPonk-PetriNets-ViewModels',
	#package : 'OpenPonk-PetriNets',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPPetriNetTransitionViewModel class >> modelClass [ ^ OPPetriNetTransition
]

{ #category : 'accessing' }
OPPetriNetTransitionViewModel >> icon [ ^ OPPetriNetsIcons transitionIcon
]
