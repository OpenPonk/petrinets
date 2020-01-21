"
A DCPetriNetNodeControllerTest is a test class for testing the behavior of DCPetriNetNodeController
"
Class {
	#name : #OPPetriNetNodeControllerTest,
	#superclass : #OPPetriNetsControllerTest,
	#category : 'OpenPonk-PetriNets-Tests'
}

{ #category : #testing }
OPPetriNetNodeControllerTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^ self name = #OPPetriNetNodeControllerTest
]

{ #category : #tests }
OPPetriNetNodeControllerTest >> testClassSideModelClass [
	self assert: self controllerClass modelClass equals: self modelClass
]

{ #category : #tests }
OPPetriNetNodeControllerTest >> testCreateFigure [
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller renderFigureIn: diagramController view.
	self assert: controller figure class = RTElement
]

{ #category : #tests }
OPPetriNetNodeControllerTest >> testCreateModel [
	self assert: (controller createModelIn: diagramController model) class = self modelClass
]

{ #category : #tests }
OPPetriNetNodeControllerTest >> testFigureRefresh [
	| text |
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller renderFigureIn: diagramController view.
	self assert: (controller figure attributeAt: #RTLabelledLabel) text = ''.
	controller model name: 'new name'.
	controller refreshFigure.
	text := (controller figure attributeAt: #RTLabelledLabel) text.
	self assert: ((text last: 8) = 'new name' or: [ (text first: 8) = 'new name' ])
]
