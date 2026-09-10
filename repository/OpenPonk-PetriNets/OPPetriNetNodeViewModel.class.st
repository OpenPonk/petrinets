"
Abstract view model for Petri Net nodes. Provides form building specifications and hierarchical information without direct GUI dependencies.
"
Class {
	#name : 'OPPetriNetNodeViewModel',
	#superclass : 'OPModelObjectViewModel',
	#category : 'OpenPonk-PetriNets-ViewModels',
	#package : 'OpenPonk-PetriNets',
	#tag : 'ViewModels'
}

{ #category : 'testing' }
OPPetriNetNodeViewModel class >> isAbstract [

	^ self = OPPetriNetNodeViewModel
]

{ #category : 'forms' }
OPPetriNetNodeViewModel >> buildEditorForm: aForm [
	(aForm addTextInput: 'Name')
		text: (self model name ifNil: [ '' ]);
		whenTextChangedDo: [ :newValue |
			self model name: newValue asString.
			self modelChanged ]
]

{ #category : 'accessing' }
OPPetriNetNodeViewModel >> childrenModels [ ^ self model connected
]

{ #category : 'accessing' }
OPPetriNetNodeViewModel >> dependentElements [

	^ (self model incoming , self model outgoing) asSet
]
