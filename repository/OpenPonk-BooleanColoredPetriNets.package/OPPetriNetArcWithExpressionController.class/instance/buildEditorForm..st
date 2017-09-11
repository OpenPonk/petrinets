forms
buildEditorForm: aForm
	(aForm addTextInput: 'Expression')
		text: self model expression;
		whenTextIsAccepted: [ :newValue | self model expression: newValue ]