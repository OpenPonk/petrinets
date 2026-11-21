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
OPPetriNetViewModelFormTest >> testViewModelMetadataIconsAndAbstractFlags [

	| project projectController petriNet place transition normalArc inhibitorArc resetArc petriNetViewModel normalArcViewModel inhibitorArcViewModel resetArcViewModel |
	petriNet := OPPetriNet named: 'Net'.
	place := OPPetriNetPTPlace named: 'P1'.
	transition := OPPetriNetTransition named: 'T1'.
	normalArc := OPPetriNetNormalArc from: place to: transition.
	inhibitorArc := OPPetriNetInhibitorArc from: place to: transition.
	resetArc := OPPetriNetResetArc from: place to: transition.
	petriNet
		add: place;
		add: transition;
		add: normalArc;
		add: inhibitorArc;
		add: resetArc.

	project := OPProject named: 'PetriNetViewModelTest'.
	project addModel: petriNet.
	projectController := OPProjectController forProject: project.
	petriNetViewModel := projectController viewModelRegistry viewModelFor: petriNet.
	self assertCollection: petriNetViewModel childrenModels hasSameElements: {
			place.
			transition }.
	self assertCollection: petriNetViewModel allChildrenModels hasSameElements: {
			place.
			transition.
			normalArc.
			inhibitorArc.
			resetArc }.

	self assert: OPPetriNetNodeViewModel isAbstract description: 'Base node view model must be abstract'.
	self deny: OPPetriNetPlaceViewModel isAbstract description: 'Place view model must be concrete'.
	self assert: OPPetriNetArcViewModel isAbstract description: 'Base arc view model must be abstract'.
	self assert: OPPetriNetWeightedArcViewModel isAbstract description: 'Base weighted arc view model must be abstract'.
	self deny: OPPetriNetNormalArcViewModel isAbstract description: 'Normal arc view model must be concrete'.
	self deny: OPPetriNetInhibitorArcViewModel isAbstract description: 'Inhibitor arc view model must be concrete'.
	self deny: OPPetriNetResetArcViewModel isAbstract description: 'Reset arc view model must be concrete'.

	normalArcViewModel := OPPetriNetNormalArcViewModel new model: normalArc.
	inhibitorArcViewModel := OPPetriNetInhibitorArcViewModel new model: inhibitorArc.
	resetArcViewModel := OPPetriNetResetArcViewModel new model: resetArc.

	self assert: normalArcViewModel icon class identicalTo: Form.
	self assert: inhibitorArcViewModel icon class identicalTo: Form.
	self assert: resetArcViewModel icon class identicalTo: Form.
	self assert: normalArcViewModel modelType equals: (OPModelObjectType named: 'Weighted Arc').
	self assert: normalArcViewModel nameOfType equals: 'Arc'.
	self assert: OPPetriNetsPlugin repositoryName equals: #petrinets
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
