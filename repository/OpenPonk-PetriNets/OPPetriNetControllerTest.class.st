Class {
	#name : 'OPPetriNetControllerTest',
	#superclass : 'OPAbstractDiagramControllerTest',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'accessing' }
OPPetriNetControllerTest >> controllerClass [
	^ OPPetriNetController
]

{ #category : 'accessing' }
OPPetriNetControllerTest >> diagramModelClass [
	^ OPPetriNet
]

{ #category : 'accessing' }
OPPetriNetControllerTest >> modelClass [
	^ OPPetriNet
]

{ #category : 'tests' }
OPPetriNetControllerTest >> testControllerFactory [
	self assert: controller controllerFactory isNotNil.
	self assert: (controller controllerFactory isKindOf: OPControllerFactory)
]

{ #category : 'tests' }
OPPetriNetControllerTest >> testInitializePalette [
	| palette |
	palette := OPPalette new.
	controller initializePalette: palette.
	self denyCollection: palette items hasSameElements: #()
]
