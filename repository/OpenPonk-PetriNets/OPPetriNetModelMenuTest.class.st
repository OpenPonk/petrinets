"
Verifies the population, state, and execution of Commander 1 model commands within the Petri Nets editor toolbar menu.
"
Class {
	#name : 'OPPetriNetModelMenuTest',
	#superclass : 'TestCase',
	#instVars : [
		'toolbarPresenter',
		'mockWorkbench'
	],
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'running' }
OPPetriNetModelMenuTest >> setUp [
	| mockProjectController |
	super setUp.
	mockWorkbench := Mock new.
	mockProjectController := Mock new.
	mockProjectController stub undoManager willReturn: OPUndoManager new.
	mockWorkbench stub projectController willReturn: mockProjectController.
	mockWorkbench stub workbench willReturn: mockWorkbench.
	toolbarPresenter := OPWorkbenchToolbar newApplication: SpApplication defaultApplication.
	toolbarPresenter owner: mockWorkbench
]

{ #category : 'running' }
OPPetriNetModelMenuTest >> tearDown [
	toolbarPresenter := nil.
	mockWorkbench := nil.
	super tearDown
]

{ #category : 'tests' }
OPPetriNetModelMenuTest >> testModelMenuContainsPetriNetCommanderActivationsWhenPetriNetEditorFocused [
	"Verifies that the Model menu contains Petri Net Commander 1 commands when a Petri Net editor is focused."
	| petriNetPlugin testEditor modelMenuItem subMenuLabels |
	petriNetPlugin := OPPluginRegistry default plugins
		detect: [ :eachPluginCandidate | eachPluginCandidate isKindOf: OPPetriNetsPlugin ].
	testEditor := (OPEditor on: petriNetPlugin)
		workbench: mockWorkbench;
		yourself.

	toolbarPresenter focusedEditor: testEditor.
	modelMenuItem := toolbarPresenter menu menuGroups first menuItems
		detect: [ :eachMenuItem | eachMenuItem name = 'Model' ].
	subMenuLabels := modelMenuItem subMenu menuGroups
		flatCollect: [ :eachGroup | eachGroup menuItems collect: [ :eachItem | eachItem name ] ].

	self assertCollection: subMenuLabels includesAll: #( 'Simulation' )
]
