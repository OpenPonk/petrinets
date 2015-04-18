*DynaCASE-PetriNets
buildEditorForm: aForm
	aForm
		addLabel: 'type' value: self model class name;
		addTextInput: 'name'
			label: 'Name'
			value: self model name
			onChange: [ :newValue | self model name: newValue ]