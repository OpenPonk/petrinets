Class {
	#name : #OPPetriNetPTPlaceController,
	#superclass : #OPPetriNetPlaceController,
	#category : #'OpenPonk-PetriNets-Controllers'
}

{ #category : #hooks }
OPPetriNetPTPlaceController >> buildEditorForm: aForm [

	| tokensSpTextPresenter |
	super buildEditorForm: aForm.
	tokensSpTextPresenter := aForm addTextInput: 'Tokens'.
	tokensSpTextPresenter
		text: self model tokens asString;
		whenTextIsAccepted: [ :newValue | 
			[ self model tokens: (newValue asString asInteger ifNil: [ 0 ]) ]
				on: OPPetriNetPlaceOverCapacity
				do: [ :ex | 
					(UIManager default confirm:
							 'Place would be over capacity. Continue?')
						ifTrue: [ ex resume ]
						ifFalse: [ tokensSpTextPresenter text: self model tokens asString ] ] ].
	(aForm addTextInput: 'Capacity')
		text: (self model capacity = SmallInteger maxVal
				 ifTrue: [ '' ]
				 ifFalse: [ self model capacity asString ]);
		whenTextIsAccepted: [ :newValue | 
			self model capacity:
					(newValue asString asInteger ifNil: [ SmallInteger maxVal ]) ]
]

{ #category : #private }
OPPetriNetPTPlaceController >> createTokenGroup [
	| label |
	tokenGroup ifNotNil: [ ^ self ].
	super createTokenGroup.
	label := RTLabel new
		color: Color black;
		text: '';
		element.
	tokenGroup := RTGroup with: label with: tokenGroup first.
	RTConstraint stick: label onTheLeftOf: tokenGroup second
]

{ #category : #hooks }
OPPetriNetPTPlaceController >> modelClass [
	^ OPPetriNetPTPlace
]

{ #category : #hooks }
OPPetriNetPTPlaceController >> refreshFigure [
	self tokenGroupFrom: self model tokens.
	^ super refreshFigure
]

{ #category : #construction }
OPPetriNetPTPlaceController >> showInDiagram: aDiagramController [
	super showInDiagram: aDiagramController.
	model when: OPPlaceTokensChanged do: [ self refreshFigure ]
]

{ #category : #construction }
OPPetriNetPTPlaceController >> showWithoutDependentInDiagram: aDiagramController [
	super showWithoutDependentInDiagram: aDiagramController.
	model when: OPPlaceTokensChanged do: [ self refreshFigure ]
]

{ #category : #private }
OPPetriNetPTPlaceController >> tokenCircle [
	"returns circle element representing presence of token(s)"

	^ self tokenGroup second
]

{ #category : #private }
OPPetriNetPTPlaceController >> tokenGroupFrom: aNumber [
	"updates token shape and label to show aNumber amount of tokens"

	self tokenCircle
		color:
			(aNumber isZero
				ifTrue: [ Color transparent ]
				ifFalse: [ Color black ]).
	self
		tokenText:
			(aNumber < 2
				ifTrue: [ '' ]
				ifFalse: [ aNumber asString ]).
	^ self tokenGroup
		translateBy: 0;
		yourself
]

{ #category : #private }
OPPetriNetPTPlaceController >> tokenLabel [
	"returns label element representing amount of tokens"

	^ self tokenGroup first
]

{ #category : #accessing }
OPPetriNetPTPlaceController >> tokenText: aString [
	"sets token amount label text"

	self tokenLabel trachelShape text: aString
]
