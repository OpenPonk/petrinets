hooks
buildEditorForm: aForm
	| tokensTextModel |
	super buildEditorForm: aForm.
	tokensTextModel := aForm addTextInput: 'Tokens'.
	tokensTextModel
		text: self model tokens asString;
		whenTextIsAccepted: [ :newValue | 
			[ self model tokens: (newValue asInteger ifNil: [ 0 ]) ]
				on: OPPetriNetPlaceOverCapacity
				do: [ :ex | 
					(UIManager default confirm: 'Place would be over capacity. Continue?')
						ifTrue: [ ex resume ]
						ifFalse: [ tokensTextModel text: self model tokens asString ] ] ].
	(aForm addTextInput: 'Capacity')
		text:
			(self model capacity = SmallInteger maxVal
				ifTrue: [ '' ]
				ifFalse: [ self model capacity asString ]);
		whenTextIsAccepted: [ :newValue | 
			self model
				capacity: (newValue asInteger ifNil: [ SmallInteger maxVal ]) ]