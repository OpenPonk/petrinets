"
A DCPetriNetNodeControllerTest is a test class for testing the behavior of DCPetriNetNodeController
"
Class {
	#name : 'OPPetriNetNodeControllerTest',
	#superclass : 'OPPetriNetsControllerTest',
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'testing' }
OPPetriNetNodeControllerTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^ self name = #OPPetriNetNodeControllerTest
]

{ #category : 'tests' }
OPPetriNetNodeControllerTest >> testCreateFigure [

	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller
		createDiagramElement;
		renderDiagramElement.
	self assert: (controller roassalShape isKindOf: RSBoundingShape)
]

{ #category : 'tests' }
OPPetriNetNodeControllerTest >> testCreateModel [
	self
		assert: (controller createModelIn: diagramController model) class
		equals: self modelClass
]

{ #category : 'tests' }
OPPetriNetNodeControllerTest >> testFigureRefresh [

	| text |
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller
		createDiagramElement;
		renderDiagramElement.
	self
		assert: (controller roassalShape propertyAt: #RSLabeled) text
		equals: ''.
	controller model name: 'new name'.
	controller diagramElement modelChanged.
	text := (controller roassalShape propertyAt: #RSLabeled) text.
	self assert:
		((text last: 8) = 'new name' or: [ (text first: 8) = 'new name' ])
]
