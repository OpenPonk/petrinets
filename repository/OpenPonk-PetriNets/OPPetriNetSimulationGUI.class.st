"
Simulation GUI presenter for Petri Net diagrams.
Manages toolbar items, simulation control, and event display during net execution.
"
Class {
	#name : 'OPPetriNetSimulationGUI',
	#superclass : 'OPSimulationGUI',
	#instVars : [
		'highlightProcesses',
		'highlightOriginalColors'
	],
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

{ #category : 'private - updating' }
OPPetriNetSimulationGUI >> clearHighlights [

	highlightOriginalColors keys copy do: [ :eachController | self restoreHighlightFor: eachController ]
]

{ #category : 'private - updating' }
OPPetriNetSimulationGUI >> closed [

	self clearHighlights.
	super closed
]

{ #category : 'private - hooks' }
OPPetriNetSimulationGUI >> displayEvent: anActionEvent [

	| controller shape |
	anActionEvent index = 2 ifFalse: [ ^ self ].
	self diagramController ifNil: [ ^ self ].
	controller := self diagramController controllerForModel: anActionEvent simulator model ifNone: [ ^ self ].
	controller diagramElement exists ifFalse: [ ^ self ].
	shape := controller roassalShape.
	shape ifNil: [ ^ self ].
	self highlightController: controller shape: shape
]

{ #category : 'private - updating' }
OPPetriNetSimulationGUI >> finishHighlightRestoreFor: aController process: aProcess [

	(highlightProcesses at: aController ifAbsent: [ nil ]) == aProcess ifFalse: [ ^ self ].
	self restoreHighlightFor: aController
]

{ #category : 'private - updating' }
OPPetriNetSimulationGUI >> highlightController: aController shape: aShape [

	highlightOriginalColors at: aController ifAbsentPut: [ aShape color ].
	highlightProcesses at: aController ifPresent: [ :existingProcess | existingProcess terminate ].
	aShape color: Color lightOrange lighter.
	aShape signalUpdate.
	self scheduleHighlightRestoreFor: aController
]

{ #category : 'initialization' }
OPPetriNetSimulationGUI >> initialize [

	super initialize.
	highlightProcesses := IdentityDictionary new.
	highlightOriginalColors := IdentityDictionary new
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

{ #category : 'private - updating' }
OPPetriNetSimulationGUI >> restoreHighlightFor: aController [

	| originalColor |
	(highlightProcesses removeKey: aController ifAbsent: [ nil ]) ifNotNil: [ :existingProcess | existingProcess terminate ].
	originalColor := highlightOriginalColors removeKey: aController ifAbsent: [ ^ self ].
	aController diagramElement exists ifFalse: [ ^ self ].
	aController roassalShape ifNotNil: [ :currentShape |
			currentShape color = originalColor ifFalse: [
					currentShape color: originalColor.
					currentShape signalUpdate ] ]
]

{ #category : 'private - updating' }
OPPetriNetSimulationGUI >> scheduleHighlightRestoreFor: aController [

	| timerProcess |
	timerProcess := [
		                | currentProcess |
		                currentProcess := Processor activeProcess.
		                (Delay forMilliseconds: 200) wait.
		                UIManager default defer: [ self finishHighlightRestoreFor: aController process: currentProcess ] ] newProcess.
	highlightProcesses at: aController put: timerProcess.
	timerProcess resume
]

{ #category : 'private - hooks' }
OPPetriNetSimulationGUI >> simulatorClass [
	^ OPPetriNetSimulator
]
