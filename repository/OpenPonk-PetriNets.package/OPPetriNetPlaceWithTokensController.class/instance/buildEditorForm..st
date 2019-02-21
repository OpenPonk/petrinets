hooks
buildEditorForm: aForm
	super buildEditorForm: aForm.
	(aForm addTextInput: 'Tokens')
		text: self model tokens asString;
		whenTextIsAccepted:
				[ :newValue | self model tokens: (newValue asInteger ifNil: [ 0 ]) ]