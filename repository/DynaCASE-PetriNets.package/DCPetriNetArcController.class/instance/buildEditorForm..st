hooks
buildEditorForm: aForm
	super buildEditorForm: aForm.
	aForm
		addTextInput: 'weight'
		label: 'Weight'
		value: self model weight asString
		onChange: [ :newValue | self model weight: (newValue asInteger ifNil: [ 0 ]) ]