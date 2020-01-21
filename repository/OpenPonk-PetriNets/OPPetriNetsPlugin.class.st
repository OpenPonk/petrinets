Class {
	#name : #OPPetriNetsPlugin,
	#superclass : #OPPlugin,
	#category : 'OpenPonk-PetriNets-Adapters'
}

{ #category : #accessing }
OPPetriNetsPlugin >> diagramControllerClass [
	^ OPPetriNetController
]

{ #category : #accessing }
OPPetriNetsPlugin >> icon [
	^ OPPetriNetsIcons current petriNetIcon
]

{ #category : #accessing }
OPPetriNetsPlugin >> modelClass [
	^ OPPetriNet
]

{ #category : #accessing }
OPPetriNetsPlugin >> name [
	^ 'Petri Net'
]

{ #category : #accessing }
OPPetriNetsPlugin >> serializerClass [
	^ OPStonSerializer
]
