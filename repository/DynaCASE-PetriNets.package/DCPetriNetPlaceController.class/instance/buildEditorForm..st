hooks
buildEditorForm: aForm
	super buildEditorForm: aForm.
	aForm
		addTextInput: 'tokens'
		label: 'tokens'
		value: self model tokens
		onChange: [ :newValue | self model tokens: newValue asInteger ]