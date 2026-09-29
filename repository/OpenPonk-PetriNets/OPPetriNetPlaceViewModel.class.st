"
View model for Petri Net places.
Provides form building specifications and icons to the workbench without GUI dependencies.
"
Class {
	#name : 'OPPetriNetPlaceViewModel',
	#superclass : 'OPPetriNetNodeViewModel',
	#category : 'OpenPonk-PetriNets-ViewModels',
	#package : 'OpenPonk-PetriNets',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPPetriNetPlaceViewModel class >> modelClass [ ^ OPPetriNetPTPlace
]

{ #category : 'building' }
OPPetriNetPlaceViewModel >> buildEditorForm: aForm [
	super buildEditorForm: aForm.
	(aForm bindNumberInput: 'Tokens' property: #tokens)
		minimum: 0.
	(aForm bindNumberInput: 'Capacity' property: #capacity)
		minimum: 0
]

{ #category : 'accessing' }
OPPetriNetPlaceViewModel >> icon [ ^ OPPetriNetsIcons placeIcon
]
