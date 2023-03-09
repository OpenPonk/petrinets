Class {
	#name : #OPPetriNetsControllerTest,
	#superclass : #OPElementControllerTest,
	#category : #'OpenPonk-PetriNets-Tests'
}

{ #category : #testing }
OPPetriNetsControllerTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^ self = OPPetriNetsControllerTest
]

{ #category : #hooks }
OPPetriNetsControllerTest >> controllerClass [
	^ self subclassResponsibility
]

{ #category : #accessing }
OPPetriNetsControllerTest >> diagramControllerClass [

	^ OPPetriNetController
]

{ #category : #accessing }
OPPetriNetsControllerTest >> diagramModelClass [
	^ OPPetriNet
]

{ #category : #hooks }
OPPetriNetsControllerTest >> modelClass [
	^ self subclassResponsibility
]

{ #category : #tests }
OPPetriNetsControllerTest >> testCreateController [
	self assert: controller class equals: self controllerClass
]

{ #category : #tests }
OPPetriNetsControllerTest >> testModelClass [
	self assert: controller modelClass equals: self modelClass
]
