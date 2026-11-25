"
Simulation GUI presenter for Petri Net diagrams. Composes modular random-playback, single-step, step-all, reset, and save-state controls on top of the shared simulation session and flashes fired transitions via the diagram highlighter without mutating persistent styles.
"
Class {
	#name : 'OPPetriNetSimulationGUI',
	#superclass : 'OPSimulationGUI',
	#category : 'OpenPonk-PetriNets-Simulation',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Simulation'
}

{ #category : 'private - hooks' }
OPPetriNetSimulationGUI >> buttonItems [

	^ {
		  (self
			   newPlayPauseButtonLabeled: 'Play (random)'
			   pauseLabel: 'Pause'
			   playHelp: 'Play random steps continuously'
			   pauseHelp: 'Pause stepping').
		  (self
			   newStepButtonLabeled: 'Step (random)'
			   help: 'Step random element once'
			   action: [ self session ifNotNil: [ :activeSession | activeSession step ] ]).
		  ((self newStepButtonLabeled: 'Step (all)' help: 'Step all enabled elements once' action: [ self stepAll ])
			   iconName: #glamorousThrough;
			   yourself).
		  self newResetButton.
		  self newSaveStateButton }
]

{ #category : 'private - hooks' }
OPPetriNetSimulationGUI >> handleSimulatorAction: anActionEvent [

	anActionEvent index = 2 ifFalse: [ ^ self ].
	self highlighter ifNotNil: [ :activeHighlighter |
		activeHighlighter flashFillOfModel: anActionEvent simulator model color: Color lightOrange lighter duration: 200 milliSeconds ]
]

{ #category : 'private - hooks' }
OPPetriNetSimulationGUI >> simulatorClass [
	^ OPPetriNetSimulator
]

{ #category : 'actions' }
OPPetriNetSimulationGUI >> stepAll [

	self session ifNotNil: [ :activeSession |
			| simulator |
			simulator := activeSession diagramSimulator.
			simulator setSteppingAll.
			[ activeSession step ] ensure: [ simulator setDefaultStepping ] ]
]

{ #category : 'testing' }
OPPetriNetSimulationGUI >> supportsSavingState [

	^ true
]
