hooks
buildEditorForm: aForm
	super buildEditorForm: aForm.
	aForm
		addTextInput: 'tokens'
		label: 'Tokens'
		value: self model tokens asString
		onChange: [ :newValue | self model tokens: (newValue asInteger ifNil: [ 0 ]) ]