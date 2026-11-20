"
Simulation GUI presenter for Petri Net diagrams.
Manages toolbar items, simulation control, and event display during net execution.
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
	^ super buttonItems
		add:
			((self newButton)
				label: 'Pause';
				iconName: #testYellow;
				help: 'Pause stepping';
				action: [ self diagramSimulator stop ]);
		add:
			((self newButton)
				label: 'Play (random)';
				iconName: #smallPrintItIcon;
				help: 'Step random element every second';
				action: [ self diagramSimulator repeat ]);
		add:
			((self newButton)
				label: 'Step (random)';
				iconName: #forwardIcon;
				help: 'Step random element once';
				action: [ self diagramSimulator step ]);
		add:
			((self newButton)
				label: 'Step (all)';
				iconName: #glamorousThrough;
				help: 'Step all enabled elements once';
				action: [ self diagramSimulator
						setSteppingAll;
						step;
						setDefaultStepping ]);
		yourself
]

{ #category : 'private - hooks' }
OPPetriNetSimulationGUI >> displayEvent: anActionEvent [

	| controller shape previousColor |
	anActionEvent index = 2 ifFalse: [ ^ self ].
	controller := self diagramController controllerForModel: anActionEvent simulator model ifNone: [ ^ self ].
	controller diagramElement exists ifFalse: [ ^ self ].
	shape := controller roassalShape.
	shape ifNil: [ ^ self ].
	previousColor := shape color.
	shape color: Color lightOrange lighter.
	shape signalUpdate.
	[
		(Delay forMilliseconds: 200) wait.
		controller diagramElement exists ifTrue: [
				controller roassalShape ifNotNil: [ :currentShape |
						currentShape color = previousColor ifFalse: [
								currentShape color: previousColor.
								currentShape signalUpdate ] ] ] ] fork
]

{ #category : 'private - hooks' }
OPPetriNetSimulationGUI >> loadSimulation [
	"prepares simulation - called with every reload"

	super loadSimulation.
	diagramSimulator simulableElementsDo: [ :element |
		element
			when: OPSimulatorDidAction
			do: [ :event | self displayEvent: event ]
			for: self ]
]

{ #category : 'private - hooks' }
OPPetriNetSimulationGUI >> simulatorClass [
	^ OPPetriNetSimulator
]
