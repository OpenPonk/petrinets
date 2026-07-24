Class {
	#name : 'OPPetriNetTransitionController',
	#superclass : 'OPPetriNetNodeController',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'class initialization' }
OPPetriNetTransitionController class >> initializePossibleConnected [
	PossibleOutgoing := Set with: OPPetriNetNormalArcController
]

{ #category : 'construction' }
OPPetriNetTransitionController >> diagramElementClass [

	^ OPPetriNetTransitionShape
]

{ #category : 'construction' }
OPPetriNetTransitionController >> hookDiagramElement [

	super hookDiagramElement.

	self diagramElement whenPlayClickedSend: #playClicked to: self
]

{ #category : 'accessing' }
OPPetriNetTransitionController >> modelClass [
	^ OPPetriNetTransition
]

{ #category : 'hooks' }
OPPetriNetTransitionController >> playClicked [

	OPPetriNetSimulationGUI stepSimulatorOfController: self
]

{ #category : 'diagram elements' }
OPPetriNetTransitionController >> unhookDiagramElement [

	super unhookDiagramElement.

	self diagramElement unsubscribe: self
]
