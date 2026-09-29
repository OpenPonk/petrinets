"
An abstract base class for Commander 1 model commands executed within a Petri Net diagram editor.
"
Class {
	#name : 'OPPetriNetCommand',
	#superclass : 'OPModelCommand',
	#category : 'OpenPonk-PetriNets-Simulation',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Simulation'
}

{ #category : 'testing' }
OPPetriNetCommand class >> canBeExecutedInEditor: anEditor [
	"Answers true if the active editor plugin is Petri Nets."
	^ anEditor plugin isKindOf: OPPetriNetsPlugin
]

{ #category : 'testing' }
OPPetriNetCommand class >> isAbstract [
	"Answers true if this class is the abstract root of Petri Net model commands."
	^ self = OPPetriNetCommand
]
