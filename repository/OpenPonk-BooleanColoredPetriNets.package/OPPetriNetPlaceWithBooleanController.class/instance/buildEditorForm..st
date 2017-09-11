forms
buildEditorForm: aForm
	| existenceBox valueBox |
	super buildEditorForm: aForm.
	existenceBox := aForm addCheckbox: 'Has token'.
	valueBox := aForm addCheckbox: 'Token value'.
	existenceBox
		state: self model token isNotNil;
		whenChangedDo: [ :newValue | 
			self model
				token:
					(newValue
						ifTrue: [ valueBox state ]
						ifFalse: [ nil ]) ].
	valueBox
		state: (self model token ifNil: [ false ]);
		whenChangedDo: [ :newValue | 
			self model token: newValue.
			existenceBox state: true ]