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
OPPetriNetsPlugin class >> repositoryName [
	^ #petrinets
]

{ #category : 'accessing' }
OPPetriNetsPlugin >> diagramControllerClass [
	^ OPPetriNetController
]

{ #category : 'templates' }
OPPetriNetsPlugin >> exampleProjectTemplates [
	"Answers example project templates for Petri Nets."

	^ { 
		(OPProjectTemplate
			named: 'Petri Net Example'
			icon: self icon
			modelFactory: [ OPPetriNetsExamples examplePetriNet ]
			isExample: true) }
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
