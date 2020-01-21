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
	#category : 'OpenPonk-PetriNets-Tests'
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
OPPetriNetArcControllerTest >> desiredHeadShape [
	^ self subclassResponsibility
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
	fromCtrl renderFigureIn: diagramController view.
	toCtrl := self toClass new.
	diagramController addController: toCtrl.
	toCtrl createModelIn: diagramController model.
	toCtrl renderFigureIn: diagramController view
]

{ #category : #tests }
OPPetriNetArcControllerTest >> testCreateFigure [
	| figure previousElementsSize |
	controller
		source: fromCtrl;
		target: toCtrl;
		model: model.
	diagramController addController: controller.
	previousElementsSize := diagramController view elements size.
	figure := controller renderFigureIn: diagramController view.
	self assert: figure class = RTEdge.
	self assert: figure from = fromCtrl figure.
	self assert: figure to = toCtrl figure.
	self assert: diagramController view elements size = (previousElementsSize + self amountOfLabels).
	self assert: (figure shape isKindOf: RTStyledMultiLine).
	self assert: figure shape color = Color black.
	self assert: figure shape head shape = self desiredHeadShape.
	self assert: figure shape dashes isNil
]

{ #category : #tests }
OPPetriNetArcControllerTest >> testCreateModel [
	| createdModel |
	controller source: fromCtrl.
	controller target: toCtrl.
	fromCtrl createModelIn: diagramController model.
	toCtrl createModelIn: diagramController model.
	createdModel := controller createModelIn: diagramController model.
	self assert: createdModel class = self modelClass.
	self assert: createdModel source = fromCtrl model.
	self assert: createdModel target = toCtrl model
]

{ #category : #tests }
OPPetriNetArcControllerTest >> testFigureRefresh [
	| label |
	controller
		source: fromCtrl;
		target: toCtrl.
	diagramController addController: controller.
	controller createModelIn: diagramController model.
	controller renderFigureIn: diagramController view.
	label := controller figure labels at: #name.
	self assert: label trachelShape text = ''.
	controller model name: 'new name'.
	controller refreshFigure.
	self assert: label trachelShape text = 'new name'
]

{ #category : #hooks }
OPPetriNetArcControllerTest >> toClass [
	^ self subclassResponsibility
]
