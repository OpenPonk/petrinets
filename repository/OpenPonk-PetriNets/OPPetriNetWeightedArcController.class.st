Class {
	#name : #OPPetriNetWeightedArcController,
	#superclass : #OPPetriNetArcController,
	#category : #'OpenPonk-PetriNets-Controllers'
}

{ #category : #forms }
OPPetriNetWeightedArcController >> buildEditorForm: aForm [

	super buildEditorForm: aForm.
	(aForm addTextInput: 'Weight')
		text: self model weight asString;
		whenTextChangedDo: [ :newValue | 
			self model weight: (newValue asString asInteger ifNil: [ 1 ]).
			self diagramElement modelChanged ]
]
