"
A DCPetriNetNormalArcControllerTest is a test class for testing the behavior of DCPetriNetNormalArcController
"
Class {
	#name : #OPPetriNetNormalArcControllerTest,
	#superclass : #OPPetriNetInputArcControllerTest,
	#category : #'OpenPonk-PetriNets-Tests'
}

{ #category : #hooks }
OPPetriNetNormalArcControllerTest >> amountOfLabels [
	^ 2
]

{ #category : #hooks }
OPPetriNetNormalArcControllerTest >> controllerClass [
	^ OPPetriNetNormalArcController
]

{ #category : #hooks }
OPPetriNetNormalArcControllerTest >> desiredHeadShape [
	^ RTSimpleArrow
]

{ #category : #hooks }
OPPetriNetNormalArcControllerTest >> modelClass [
	^ OPPetriNetNormalArc
]

{ #category : #tests }
OPPetriNetNormalArcControllerTest >> testFigureRefresh [

	| label |
	super testFigureRefresh.
	label := controller diagramElement ownedElements second.
	self assert: label roassalShape text equals: ''.
	controller model weight: 10.
	controller diagramElement modelChanged.
	self assert: (label roassalShape text last: 2) equals: '10'
]
