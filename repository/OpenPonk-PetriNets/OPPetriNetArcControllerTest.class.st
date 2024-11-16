"
A DCPetriNetArcControllerTest is a test class for testing the behavior of DCPetriNetArcController
"
Class {
	#name : 'OPPetriNetArcControllerTest',
	#superclass : 'OPAbstractDirectionalRelationshipControllerTest',
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'testing' }
OPPetriNetArcControllerTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^ self = OPPetriNetArcControllerTest
]

{ #category : 'hooks' }
OPPetriNetArcControllerTest >> amountOfLabels [
	^ 1
]

{ #category : 'accessing' }
OPPetriNetArcControllerTest >> diagramControllerClass [

	^ OPPetriNetController
]

{ #category : 'accessing' }
OPPetriNetArcControllerTest >> diagramModelClass [
	^ OPPetriNet
]

{ #category : 'tests' }
OPPetriNetArcControllerTest >> testFigureRefresh [

	| label |
	self showInDiagram.
	label := controller diagramElement ownedElements first.
	self assert: label roassalShape text equals: ''.
	controller model name: 'new name'.
	controller modelChanged.
	self assert: label roassalShape text equals: 'new name'
]
