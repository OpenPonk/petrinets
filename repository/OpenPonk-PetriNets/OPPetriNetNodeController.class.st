Class {
	#name : 'OPPetriNetNodeController',
	#superclass : 'OPElementController',
	#classInstVars : [
		'PossibleOutgoing'
	],
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'class initialization' }
OPPetriNetNodeController class >> initializePossibleConnected [
	self subclassResponsibility
]

{ #category : 'testing' }
OPPetriNetNodeController class >> isPossibleOutgoing: aController [
	PossibleOutgoing ifNil: [ self initializePossibleConnected ].
	^ PossibleOutgoing includes: aController
]

{ #category : 'forms' }
OPPetriNetNodeController >> buildEditorForm: aForm [

	(aForm addText: 'Name')
		text: self model name;
		whenTextChangedDo: [ :newValue |
			self model name: newValue asString.
			self modelChanged ]
]

{ #category : 'testing' }
OPPetriNetNodeController >> canBeSourceFor: aController [
	^ self class isPossibleOutgoing: aController class
]

{ #category : 'testing' }
OPPetriNetNodeController >> canBeTargetFor: aController [
	^ (aController isKindOf: OPPetriNetArcController) and: [ self class ~= aController source class ]
]

{ #category : 'accessing' }
OPPetriNetNodeController >> dependentElements [

	^ (self model incoming , self model outgoing) asSet
]

{ #category : 'rendering' }
OPPetriNetNodeController >> diagramElementClass [

	^ OPPetriNetNodeShape
]

{ #category : 'announcements' }
OPPetriNetNodeController >> internalSubscribeTo: aModel [

	super internalSubscribeTo: aModel.
	aModel weakWhen: OPElementRemoved send: #removeControllerAndDiagramElement to: self
]

{ #category : 'destruction' }
OPPetriNetNodeController >> removeModel [

	self diagramController model remove: self model.
	super removeModel
]
