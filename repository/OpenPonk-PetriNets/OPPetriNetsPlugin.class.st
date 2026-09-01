"
Defines the plugin configuration for Petri Nets. Maps top-level controllers, models, view models, and serializers for the OpenPonk framework.
"
Class {
	#name : 'OPPetriNetsPlugin',
	#superclass : 'OPPlugin',
	#category : 'OpenPonk-PetriNets-ViewModels',
	#package : 'OpenPonk-PetriNets',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPPetriNetsPlugin >> diagramControllerClass [
	^ OPPetriNetController
]

{ #category : 'accessing' }
OPPetriNetsPlugin >> icon [
	^ OPPetriNetsIcons petriNetIcon
]

{ #category : 'accessing' }
OPPetriNetsPlugin >> layouterClass [
	^ OPPetriNetLayouter
]

{ #category : 'accessing' }
OPPetriNetsPlugin >> modelClass [
	^ OPPetriNet
]

{ #category : 'accessing' }
OPPetriNetsPlugin >> modelSerializerClass [
	^ OPStonModelSerializer
]

{ #category : 'accessing' }
OPPetriNetsPlugin >> name [
	^ 'Petri Net'
]

{ #category : 'testing' }
OPPetriNetsPlugin >> supportsHidingElements [
	^ true
]
