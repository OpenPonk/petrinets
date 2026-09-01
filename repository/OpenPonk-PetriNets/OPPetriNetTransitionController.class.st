"
Controller for Petri Net transitions.
Manages diagram interactions, execution triggers (e.g., play clicks), and connection constraints.
"
Class {
	#name : 'OPPetriNetTransitionController',
	#superclass : 'OPPetriNetNodeController',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPPetriNetTransitionController class >> diagramElementClass [

	^ OPPetriNetTransitionShape
]

{ #category : 'class initialization' }
OPPetriNetTransitionController class >> initializePossibleConnected [
	PossibleOutgoing := Set with: OPPetriNetNormalArcController
]

{ #category : 'accessing' }
OPPetriNetTransitionController class >> viewModelClass [
	^ OPPetriNetTransitionViewModel
]

{ #category : 'construction' }
OPPetriNetTransitionController >> hookDiagramElement [

	super hookDiagramElement.

	self diagramElement whenPlayClickedSend: #playClicked to: self
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
