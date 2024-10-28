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

{ #category : 'rendering' }
OPPetriNetTransitionController >> hookDiagramElement [

	super hookDiagramElement.

	self diagramElement whenPlayClickedSend: #playClicked to: self
]

{ #category : 'hooks' }
OPPetriNetTransitionController >> modelClass [
	^ OPPetriNetTransition
]

{ #category : 'rendering' }
OPPetriNetTransitionController >> playClicked [

	OPPetriNetSimulationGUI stepSimulatorOfController: self
]

{ #category : 'rendering' }
OPPetriNetTransitionController >> unhookDiagramElement [

	super unhookDiagramElement.

	self diagramElement unsubscribe: self
]
