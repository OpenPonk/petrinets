Class {
	#name : 'OPBCPetriNetsPlugin',
	#superclass : 'OPPetriNetsPlugin',
	#category : 'OpenPonk-BooleanColoredPetriNets-Adapters',
	#package : 'OpenPonk-BooleanColoredPetriNets',
	#tag : 'Adapters'
}

{ #category : 'accessing' }
OPBCPetriNetsPlugin >> diagramControllerClass [
	^ OPBCPetriNetController
]

{ #category : 'accessing' }
OPBCPetriNetsPlugin >> modelClass [
	^ OPBCPetriNet
]

{ #category : 'accessing' }
OPBCPetriNetsPlugin >> name [
	^ 'Boolean Colored Petri Net'
]
