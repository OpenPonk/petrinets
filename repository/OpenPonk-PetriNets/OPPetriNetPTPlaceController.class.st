Class {
	#name : 'OPPetriNetPTPlaceController',
	#superclass : 'OPPetriNetPlaceController',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'forms' }
OPPetriNetPTPlaceController >> buildEditorForm: aForm [

	| tokensSpTextPresenter |
	super buildEditorForm: aForm.
	tokensSpTextPresenter := aForm addNumberInput: 'Tokens'.
	tokensSpTextPresenter
		text: self model tokens asString;
		minimum: 0;
		whenTextChangedDo: [ :newValue |
				[ self model tokens: ((newValue asInteger ifNil: [ 0 ]) max: 0) ]
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
						((newValue asInteger ifNil: [ SmallInteger maxVal ]) max: 0) ]
]

{ #category : 'construction' }
OPPetriNetPTPlaceController >> diagramElementClass [

	^ OPPetriNetPTPlaceShape
]

{ #category : 'announcements' }
OPPetriNetPTPlaceController >> internalSubscribeTo: aModel [

	super internalSubscribeTo: aModel.
	aModel weakWhen: OPPlaceTokensChanged send: #modelChanged to: self
]

{ #category : 'accessing' }
OPPetriNetPTPlaceController >> modelClass [
	^ OPPetriNetPTPlace
]
