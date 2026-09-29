"
A model command that opens the Petri Net token simulation runner for the active diagram.
"
Class {
	#name : 'OPPetriNetSimulationCommand',
	#superclass : 'OPPetriNetCommand',
	#category : 'OpenPonk-PetriNets-Simulation',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Simulation'
}

{ #category : 'activation' }
OPPetriNetSimulationCommand class >> modelMenuActivation [
	<classAnnotation>
	^ OPModelMenuActivation
		byItemOf: OPModelBasicMenuGroup
		order: 10
		for: OPEditor
]

{ #category : 'accessing' }
OPPetriNetSimulationCommand >> defaultMenuIconName [
	"Answers the icon name for the Petri Net simulation command."
	^ #glamorousSpawn
]

{ #category : 'accessing' }
OPPetriNetSimulationCommand >> defaultMenuItemName [
	"Answers the display name of the Petri Net simulation command."
	^ 'Simulation'
]

{ #category : 'execution' }
OPPetriNetSimulationCommand >> execute [
	"Opens the Petri Net simulation GUI for the active diagram controller."
	OPPetriNetSimulationGUI diagramController: self diagramController
]
