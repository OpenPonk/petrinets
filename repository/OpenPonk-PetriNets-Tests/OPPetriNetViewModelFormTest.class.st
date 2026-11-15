"
Tests dynamic property form generation, field bindings, and validation for Petri Net view models.
"
Class {
	#name : 'OPPetriNetViewModelFormTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-PetriNets-Tests-ViewModels',
	#package : 'OpenPonk-PetriNets-Tests',
	#tag : 'ViewModels'
}

{ #category : 'tests' }
OPPetriNetViewModelFormTest >> testNodeViewModelRegistersBindingForName [

	| form viewModel model |
	model := OPPetriNetPTPlace new name: 'P1'.
	viewModel := OPPetriNetNodeViewModel new model: model.
	form := OPPropertiesForm new.
	viewModel buildEditorForm: form.
	self assert: (form bindings collect: #selector as: Array) equals: #( #name ).
	self assert: (form bindings collect: #class as: Array) equals: { OPFormTextBinding }.
	self
		assert: (form bindings collect: [ :eachBinding | eachBinding presenter class ] as: Array)
		equals: { SpTextInputFieldPresenter }
]

{ #category : 'tests' }
OPPetriNetViewModelFormTest >> testPlaceViewModelBindsTokensAndCapacity [

	| form viewModel model |
	model := OPPetriNetPTPlace new
		         tokens: 5;
		         capacity: 20;
		         yourself.
	viewModel := OPPetriNetPlaceViewModel new model: model.
	form := OPPropertiesForm new.
	viewModel buildEditorForm: form.
	self assert: (form bindings collect: #selector as: Array) equals: #( #name #tokens #capacity ).
	self assert: (form bindings collect: #class as: Array) equals: {
			OPFormTextBinding.
			OPFormNumberBinding.
			OPFormNumberBinding }.
	self assert: (form bindings collect: [ :eachBinding | eachBinding presenter class ] as: Array) equals: {
			SpTextInputFieldPresenter.
			SpNumberInputFieldPresenter.
			SpNumberInputFieldPresenter }
]

{ #category : 'tests' }
OPPetriNetViewModelFormTest >> testWeightedArcViewModelBindsWeight [

	| form viewModel model |
	model := OPPetriNetWeightedArc new
		         weight: 3;
		         yourself.
	viewModel := OPPetriNetWeightedArcViewModel new model: model.
	form := OPPropertiesForm new.
	viewModel buildEditorForm: form.
	self assert: (form bindings collect: #selector as: Array) equals: #( #name #weight ).
	self assert: (form bindings collect: #class as: Array) equals: {
			OPFormTextBinding.
			OPFormNumberBinding }.
	self assert: (form bindings collect: [ :eachBinding | eachBinding presenter class ] as: Array) equals: {
			SpTextInputFieldPresenter.
			SpNumberInputFieldPresenter }
]
