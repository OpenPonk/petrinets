"
A DCPetriNetPlaceControllerTest is a test class for testing the behavior of DCPetriNetPlaceController
"
Class {
	#name : #OPPetriNetPlaceWithTokensControllerTest,
	#superclass : #OPPetriNetNodeControllerTest,
	#category : 'OpenPonk-PetriNets-Tests'
}

{ #category : #hooks }
OPPetriNetPlaceWithTokensControllerTest >> controllerClass [
	^ OPPetriNetPTPlaceController
]

{ #category : #hooks }
OPPetriNetPlaceWithTokensControllerTest >> modelClass [
	^ OPPetriNetPTPlace
]

{ #category : #tests }
OPPetriNetPlaceWithTokensControllerTest >> testTokenGroupFrom [
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller renderFigureIn: diagramController view.
	controller tokenGroupFrom: 0.
	self assert: controller tokenCircle trachelShape color = Color transparent.
	self assert: controller tokenLabel trachelShape color = Color transparent | (controller tokenLabel trachelShape text = '').
	controller tokenGroupFrom: 1.
	self assert: controller tokenCircle trachelShape color = Color black.
	self assert: controller tokenLabel trachelShape color = Color transparent | (controller tokenLabel trachelShape text = '').
	controller tokenGroupFrom: 111.
	self assert: controller tokenCircle trachelShape color = Color black.
	self assert: controller tokenLabel trachelShape color = Color black.
	self assert: controller tokenLabel trachelShape text = '111'.
	controller tokenGroupFrom: 9.
	self assert: controller tokenCircle trachelShape color = Color black.
	self assert: controller tokenLabel trachelShape color = Color black.
	self assert: controller tokenLabel trachelShape text = '9'.
	controller tokenGroupFrom: 1.
	self assert: controller tokenCircle trachelShape color = Color black.
	self assert: controller tokenLabel trachelShape color = Color transparent | (controller tokenLabel trachelShape text = '').
	controller tokenGroupFrom: 1.
	controller tokenGroupFrom: 0.
	self assert: controller tokenCircle trachelShape color = Color transparent.
	self assert: controller tokenLabel trachelShape color = Color transparent | (controller tokenLabel trachelShape text = '')
]
