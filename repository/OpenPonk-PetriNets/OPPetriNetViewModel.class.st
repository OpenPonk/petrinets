"
View model for the top-level Petri Net model. Provides child models and icon definitions for the workbench tree and UI integration.
"
Class {
	#name : 'OPPetriNetViewModel',
	#superclass : 'OPModelObjectViewModel',
	#category : 'OpenPonk-PetriNets-ViewModels',
	#package : 'OpenPonk-PetriNets',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPPetriNetViewModel class >> commonModelClassPrefix [

	^ 'OPPetriNet'
]

{ #category : 'accessing' }
OPPetriNetViewModel class >> modelClass [ ^ OPPetriNet
]

{ #category : 'accessing' }
OPPetriNetViewModel >> childrenModels [ ^ self model nodes
]

{ #category : 'accessing' }
OPPetriNetViewModel >> icon [ ^ OPPetriNetsIcons petriNetIcon
]

{ #category : 'accessing' }
OPPetriNetViewModel >> modelRootViewModel [

	^ self
]
