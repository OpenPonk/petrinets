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

{ #category : #hooks }
OPPetriNetTransitionController >> modelClass [
	^ OPPetriNetTransition
]

{ #category : #rendering }
OPPetriNetTransitionController >> renderDiagramElement [

	super renderDiagramElement.
	diagramElement whenPlayClickedDo: [ 
		OPPetriNetSimulationGUI stepSimulatorOfController: self ]
]
