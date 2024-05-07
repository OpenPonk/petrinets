Class {
	#name : 'OPPetriNetArcController',
	#superclass : 'OPDirectionalRelationshipController',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'rendering' }
OPPetriNetArcController >> ensureSourceAndTargetIn: aDiagramController [

	source ifNil: [ 
		self source:
			(aDiagramController showWithoutDependentInDiagramModel:
				 model source) ].
	target ifNil: [ 
		self target:
			(aDiagramController showWithoutDependentInDiagramModel:
				 model target) ]
]

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

{ #category : 'rendering' }
OPPetriNetArcController >> showInDiagram: aDiagramController [

	self ensureSourceAndTargetIn: aDiagramController.
	^ super showInDiagram: aDiagramController
]

{ #category : 'rendering' }
OPPetriNetArcController >> showWithoutDependentInDiagram: aDiagramController [

	self ensureSourceAndTargetIn: aDiagramController.
	^ super showWithoutDependentInDiagram: aDiagramController
]
