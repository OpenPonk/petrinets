Class {
	#name : 'OPPetriNetViewModelFormTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'tests' }
OPPetriNetViewModelFormTest >> testNodeViewModelRegistersBindingForName [
	| form viewModel model |
	model := OPPetriNetPTPlace new name: 'P1'.
	viewModel := OPPetriNetNodeViewModel new model: model.
	form := OPPropertiesForm new.
	viewModel buildEditorForm: form.
	self assert: (form bindings anySatisfy: [ :each | each selector = #name ])
]

{ #category : 'tests' }
OPPetriNetViewModelFormTest >> testPlaceViewModelBindsTokensAndCapacity [
	| form viewModel model |
	model := OPPetriNetPTPlace new tokens: 5; capacity: 20; yourself.
	viewModel := OPPetriNetPlaceViewModel new model: model.
	form := OPPropertiesForm new.
	viewModel buildEditorForm: form.
	self assert: (form bindings anySatisfy: [ :each | each selector = #tokens ]).
	self assert: (form bindings anySatisfy: [ :each | each selector = #capacity ])
]

{ #category : 'tests' }
OPPetriNetViewModelFormTest >> testWeightedArcViewModelBindsWeight [
	| form viewModel model |
	model := OPPetriNetWeightedArc new weight: 3; yourself.
	viewModel := OPPetriNetWeightedArcViewModel new model: model.
	form := OPPropertiesForm new.
	viewModel buildEditorForm: form.
	self assert: (form bindings anySatisfy: [ :each | each selector = #weight ])
]
