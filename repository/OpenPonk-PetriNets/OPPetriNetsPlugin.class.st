Class {
	#name : #OPPetriNetsPlugin,
	#superclass : #OPPlugin,
	#category : #'OpenPonk-PetriNets-Adapters'
}

{ #category : #accessing }
OPPetriNetsPlugin >> diagramControllerClass [
	^ OPPetriNetController
]

{ #category : #accessing }
OPPetriNetsPlugin >> icon [
	^ OPPetriNetsIcons current petriNetIcon
]

{ #category : #'as yet unclassified' }
OPPetriNetsPlugin >> layouterClass [
	^ OPPetriNetLayouter
]

{ #category : #accessing }
OPPetriNetsPlugin >> modelClass [
	^ OPPetriNet
]

{ #category : #accessing }
OPPetriNetsPlugin >> modelSerializerClass [
	^ OPStonModelSerializer
]

{ #category : #accessing }
OPPetriNetsPlugin >> name [
	^ 'Petri Net'
]

{ #category : #'as yet unclassified' }
OPPetriNetsPlugin >> supportsHidingElements [
	^ true
]
