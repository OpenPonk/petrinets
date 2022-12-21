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

{ #category : #hooks }
OPPetriNetPlaceWithTokensControllerTest >> modelClass [
	^ OPPetriNetPTPlace
]

{ #category : #tests }
OPPetriNetPlaceWithTokensControllerTest >> testTokenGroupFrom [
	controller createModelIn: diagramController model.
	diagramController addController: controller.
	controller renderFigureIn: diagramController view.
	controller updateTokenAmount: 0.
	self
		assert: controller tokenCircle trachelShape color
		equals: Color transparent.
	self
		assert:
			controller tokenLabel trachelShape color = Color transparent
				| (controller tokenLabel trachelShape text = '').
	controller updateTokenAmount: 1.
	self
		assert: controller tokenCircle trachelShape color
		equals: Color black.
	self
		assert:
			controller tokenLabel trachelShape color = Color transparent
				| (controller tokenLabel trachelShape text = '').
	controller updateTokenAmount: 111.
	self
		assert: controller tokenCircle trachelShape color
		equals: Color black.
	self
		assert: controller tokenLabel trachelShape color
		equals: Color black.
	self assert: controller tokenLabel trachelShape text equals: '111'.
	controller updateTokenAmount: 9.
	self
		assert: controller tokenCircle trachelShape color
		equals: Color black.
	self
		assert: controller tokenLabel trachelShape color
		equals: Color black.
	self assert: controller tokenLabel trachelShape text equals: '9'.
	controller updateTokenAmount: 1.
	self
		assert: controller tokenCircle trachelShape color
		equals: Color black.
	self
		assert:
			controller tokenLabel trachelShape color = Color transparent
				| (controller tokenLabel trachelShape text = '').
	controller updateTokenAmount: 1.
	controller updateTokenAmount: 0.
	self
		assert: controller tokenCircle trachelShape color
		equals: Color transparent.
	self
		assert:
			controller tokenLabel trachelShape color = Color transparent
				| (controller tokenLabel trachelShape text = '')
]
