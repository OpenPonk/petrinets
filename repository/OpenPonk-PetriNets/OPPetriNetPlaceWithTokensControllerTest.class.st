"
A DCPetriNetPlaceControllerTest is a test class for testing the behavior of DCPetriNetPlaceController
"
Class {
	#name : #OPPetriNetPlaceWithTokensControllerTest,
	#superclass : #OPPetriNetNodeControllerTest,
	#category : #'OpenPonk-PetriNets-Tests'
}

{ #category : #hooks }
OPPetriNetPlaceWithTokensControllerTest >> controllerClass [
	^ OPPetriNetPTPlaceController
]

{ #category : #construction }
OPPetriNetPlaceWithTokensControllerTest >> diagramElementClass [

	^ OPPetriNetPTPlaceShape
]

{ #category : #hooks }
OPPetriNetPlaceWithTokensControllerTest >> modelClass [
	^ OPPetriNetPTPlace
]

{ #category : #tests }
OPPetriNetPlaceWithTokensControllerTest >> testTokenGroupFrom [

	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller
		createDiagramElement;
		renderDiagramElement.
	controller model tokens: 0.
	self
		assert: controller diagramElement tokenCircle color
		equals: Color transparent.
	self assert:
		controller diagramElement tokenLabel color = Color transparent
		| (controller diagramElement tokenLabel text = '').
	controller model tokens: 1.
	self
		assert: controller diagramElement tokenCircle color
		equals: Color black.
	self assert:
		controller diagramElement tokenLabel color = Color transparent
		| (controller diagramElement tokenLabel text = '').
	controller model tokens: 111.
	self
		assert: controller diagramElement tokenCircle color
		equals: Color black.
	self
		assert: controller diagramElement tokenLabel color
		equals: Color black.
	self assert: controller diagramElement tokenLabel text equals: '111'.
	controller model tokens: 9.
	self
		assert: controller diagramElement tokenCircle color
		equals: Color black.
	self
		assert: controller diagramElement tokenLabel color
		equals: Color black.
	self assert: controller diagramElement tokenLabel text equals: '9'.
	controller model tokens: 1.
	self
		assert: controller diagramElement tokenCircle color
		equals: Color black.
	self assert:
		controller diagramElement tokenLabel color = Color transparent
		| (controller diagramElement tokenLabel text = '').
	controller model tokens: 1.
	controller model tokens: 0.
	self
		assert: controller diagramElement tokenCircle color
		equals: Color transparent.
	self assert:
		controller diagramElement tokenLabel color = Color transparent
		| (controller diagramElement tokenLabel text = '')
]
