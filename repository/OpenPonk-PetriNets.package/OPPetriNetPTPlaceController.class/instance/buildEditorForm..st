hooks
buildEditorForm: aForm
	super buildEditorForm: aForm.
	(aForm addTextInput: 'Tokens')
		text: self model tokens asString;
		whenTextIsAccepted: [ :newValue | self model tokens: (newValue asInteger ifNil: [ 0 ]) ].
	(aForm addTextInput: 'Capacity')
		text:
			(self model capacity isInfinite
				ifTrue: [ '' ]
				ifFalse: [ self model capacity asString ]);
		whenTextIsAccepted: [ :newValue | self model capacity: (newValue asInteger ifNil: [ Float infinity ]) ]