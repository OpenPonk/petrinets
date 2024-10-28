Class {
	#name : 'OPPetriNetArcController',
	#superclass : 'OPDirectionalRelationshipController',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'announcements' }
OPPetriNetArcController >> internalSubscribeTo: aModel [

	super internalSubscribeTo: aModel.
	aModel weakWhen: OPElementRemoved send: #removeControllerAndDiagramElement to: self
]

{ #category : 'testing' }
OPPetriNetArcController >> isHideable [
	^ true
]

{ #category : 'destruction' }
OPPetriNetArcController >> removeModel [

	self diagramController model remove: self model.
	super removeModel
]
