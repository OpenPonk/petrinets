Class {
	#name : #OPPetriNetWeightedArcController,
	#superclass : #OPPetriNetArcController,
	#category : 'OpenPonk-PetriNets-Controllers'
}

{ #category : #rendering }
OPPetriNetWeightedArcController >> addLabels [
	super addLabels.
	self constraintLabel: #weight balance: 0.7 offset: 12
]

{ #category : #forms }
OPPetriNetWeightedArcController >> buildEditorForm: aForm [
	super buildEditorForm: aForm.
	(aForm addTextInput: 'Weight')
		text: self model weight asString;
		whenTextIsAccepted: [ :newValue | 
			self model weight: (newValue asInteger ifNil: [ 1 ]).
			self refreshFigure ]
]

{ #category : #hooks }
OPPetriNetWeightedArcController >> refreshFigure [
	super refreshFigure.
	(figure labels at: #weight) trachelShape text: self weightText
]

{ #category : #accessing }
OPPetriNetWeightedArcController >> weightText [
	"gets weight from model and transforms it into string"

	| weight |
	weight := self model weight.
	^ weight = 1
		ifTrue: [ '' ]
		ifFalse: [ 'weight: ' , weight asString ]
]
