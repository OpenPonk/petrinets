"
A DCPetriNetArcControllerTest is a test class for testing the behavior of DCPetriNetArcController
"
Class {
	#name : #OPPetriNetArcControllerTest,
	#superclass : #OPPetriNetsControllerTest,
	#instVars : [
		'fromCtrl',
		'toCtrl'
	],
	#category : #'OpenPonk-PetriNets-Tests'
}

{ #category : #testing }
OPPetriNetArcControllerTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^ self = OPPetriNetArcControllerTest
]

{ #category : #hooks }
OPPetriNetArcControllerTest >> amountOfLabels [
	^ 1
]

{ #category : #hooks }
OPPetriNetArcControllerTest >> fromClass [
	^ self subclassResponsibility
]

{ #category : #running }
OPPetriNetArcControllerTest >> setUp [

	super setUp.
	fromCtrl := self fromClass new.
	diagramController addController: fromCtrl.
	fromCtrl createModelIn: diagramController model.
	fromCtrl
		createDiagramElement;
		renderDiagramElement.
	toCtrl := self toClass new.
	diagramController addController: toCtrl.
	toCtrl createModelIn: diagramController model.
	toCtrl
		createDiagramElement;
		renderDiagramElement
]

{ #category : #tests }
OPPetriNetArcControllerTest >> testCreateDiagramElement [

	controller model: model.
	controller model source: fromCtrl model.
	controller model target: toCtrl model.

	super testCreateDiagramElement
]

{ #category : #tests }
OPPetriNetArcControllerTest >> testCreateFigure [

	| figure previousElementsSize |
	controller
		source: fromCtrl;
		target: toCtrl;
		model: model.
	diagramController addController: controller.
	previousElementsSize := diagramController canvas nodes size.
	figure := controller
		          createDiagramElement;
		          renderDiagramElement.
	self assert: figure class equals: OPRSPolyline.
	self assert: figure from equals: fromCtrl roassalShape.
	self assert: figure to equals: toCtrl roassalShape.
	self
		assert: diagramController canvas nodes size
		equals: previousElementsSize + self amountOfLabels.
	self assert: figure shape color equals: Color black.
	self assert: figure shape markerEnd isNotNil
]

{ #category : #tests }
OPPetriNetArcControllerTest >> testCreateModel [
	| createdModel |
	controller source: fromCtrl.
	controller target: toCtrl.
	fromCtrl createModelIn: diagramController model.
	toCtrl createModelIn: diagramController model.
	createdModel := controller createModelIn: diagramController model.
	self assert: createdModel class equals: self modelClass.
	self assert: createdModel source equals: fromCtrl model.
	self assert: createdModel target equals: toCtrl model
]

{ #category : #tests }
OPPetriNetArcControllerTest >> testFigureRefresh [

	| label |
	controller
		source: fromCtrl;
		target: toCtrl.
	diagramController addController: controller.
	controller createModelIn: diagramController model.
	controller
		createDiagramElement;
		renderDiagramElement.
	label := controller diagramElement ownedElements first.
	self assert: label roassalShape text equals: ''.
	controller model name: 'new name'.
	controller diagramElement modelChanged.
	self assert: label roassalShape text equals: 'new name'
]

{ #category : #hooks }
OPPetriNetArcControllerTest >> toClass [
	^ self subclassResponsibility
]
