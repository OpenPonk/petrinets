Class {
	#name : 'OPPetriNetPTPlaceController',
	#superclass : 'OPPetriNetPlaceController',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'hooks' }
OPPetriNetPTPlaceController >> buildEditorForm: aForm [

	| tokensSpTextPresenter |
	super buildEditorForm: aForm.
	tokensSpTextPresenter := aForm addNumberInput: 'Tokens'.
	tokensSpTextPresenter
		text: self model tokens asString;
		whenTextChangedDo: [ :newValue | 
			[ 
			self model tokens:
					((newValue asString asInteger ifNil: [ 0 ]) max: 0) ]
				on: OPPetriNetPlaceOverCapacity
				do: [ :ex | 
					(UIManager default confirm:
							 'Place would be over capacity. Continue?')
						ifTrue: [ ex resume ]
						ifFalse: [ 
							tokensSpTextPresenter text: self model tokens asString ] ] ].
	(aForm addTextInput: 'Capacity')
		text: (self model capacity = SmallInteger maxVal
				 ifTrue: [ '' ]
				 ifFalse: [ self model capacity asString ]);
		whenTextChangedDo: [ :newValue | 
			self model capacity:
					(newValue asString asInteger ifNil: [ SmallInteger maxVal ]) ]
]

{ #category : 'construction' }
OPPetriNetPTPlaceController >> diagramElementClass [

	^ OPPetriNetPTPlaceShape
]

{ #category : 'construction' }
OPPetriNetPTPlaceController >> internalSubscribeTo: aModel [

	super internalSubscribeTo: aModel.
	aModel weakWhen: OPPlaceTokensChanged send: #modelChanged to: self
]

{ #category : 'hooks' }
OPPetriNetPTPlaceController >> modelClass [
	^ OPPetriNetPTPlace
]
