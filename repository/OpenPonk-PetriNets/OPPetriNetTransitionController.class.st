Class {
	#name : #OPPetriNetTransitionController,
	#superclass : #OPPetriNetNodeController,
	#category : #'OpenPonk-PetriNets-Controllers'
}

{ #category : #'class initialization' }
OPPetriNetTransitionController class >> initializePossibleConnected [
	PossibleOutgoing := Set with: OPPetriNetNormalArcController
]

{ #category : #construction }
OPPetriNetTransitionController >> diagramElementClass [

	^ OPPetriNetTransitionShape
]

{ #category : #rendering }
OPPetriNetTransitionController >> hookDiagramElement [

	super hookDiagramElement.

	diagramElement whenPlayClickedDo: [ 
		OPPetriNetSimulationGUI stepSimulatorOfController: self ]
]

{ #category : #hooks }
OPPetriNetTransitionController >> modelClass [
	^ OPPetriNetTransition
]
