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

{ #category : 'forms' }
OPPetriNetWeightedArcViewModel >> buildEditorForm: aForm [

	super buildEditorForm: aForm.
	(aForm addNumberInput: 'Weight')
		text: self model weight asString;
		minimum: 1;
		whenTextChangedDo: [ :newValue |
				self model weight: ((newValue asInteger ifNil: [ 1 ]) max: 1).
				self modelChanged ]
]
