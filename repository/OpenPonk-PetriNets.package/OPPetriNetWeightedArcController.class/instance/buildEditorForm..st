hooks
buildEditorForm: aForm
	super buildEditorForm: aForm.
	(aForm addTextInput: 'Weight')
		text: self model weight asString;
		whenTextIsAccepted: [ :newValue | self model weight: (newValue asInteger ifNil: [ 1 ]) ]