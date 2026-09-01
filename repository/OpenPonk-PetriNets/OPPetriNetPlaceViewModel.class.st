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

{ #category : 'forms' }
OPPetriNetPlaceViewModel >> buildEditorForm: aForm [

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

{ #category : 'accessing' }
OPPetriNetPlaceViewModel >> icon [ ^ OPPetriNetsIcons placeIcon
]
