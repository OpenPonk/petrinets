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
	aModel when: OPElementRemoved send: #removeController to: self
]

{ #category : 'testing' }
OPPetriNetArcController >> isHideable [
	^ true
]

{ #category : 'removing' }
OPPetriNetArcController >> removeModel [
	self model announcer unsubscribe: self.
	self diagramController model remove: self model
]
