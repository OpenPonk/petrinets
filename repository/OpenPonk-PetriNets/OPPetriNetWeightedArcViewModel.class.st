"
Abstract view model for Petri Net weighted arcs.
Provides form building specifications and property editing structures without direct GUI dependencies.
"
Class {
	#name : 'OPPetriNetWeightedArcViewModel',
	#superclass : 'OPPetriNetArcViewModel',
	#category : 'OpenPonk-PetriNets-ViewModels',
	#package : 'OpenPonk-PetriNets',
	#tag : 'ViewModels'
}

{ #category : 'testing' }
OPPetriNetWeightedArcViewModel class >> isAbstract [

	^ self = OPPetriNetWeightedArcViewModel
]

{ #category : 'building' }
OPPetriNetWeightedArcViewModel >> buildEditorForm: aForm [
	super buildEditorForm: aForm.
	(aForm bindNumberInput: 'Weight' property: #weight)
		minimum: 1
]
