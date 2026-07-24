Class {
	#name : 'OPPetriNetWeightedArcController',
	#superclass : 'OPPetriNetArcController',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'forms' }
OPPetriNetWeightedArcController >> buildEditorForm: aForm [

	super buildEditorForm: aForm.
	(aForm addNumberInput: 'Weight')
		text: self model weight asString;
		minimum: 1;
		whenTextChangedDo: [ :newValue |
				self model weight: ((newValue asInteger ifNil: [ 1 ]) max: 1).
				self modelChanged ]
]
