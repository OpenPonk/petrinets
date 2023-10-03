"
I'm DCSimulationGUI for Petri nets
"
Class {
	#name : #OPPetriNetSimulationGUI,
	#superclass : #OPSimulationGUI,
	#category : #'OpenPonk-PetriNets-Simulation'
}

{ #category : #hooks }
OPPetriNetSimulationGUI class >> simulableControllerClasses [
	"collection of element controllers whose single simulators can be fired independently
	for example: in Petri nets, only transitions are simulable = one specific transition can be fired"

	^ OPPetriNetTransitionController asOrderedCollection
]

{ #category : #toolbar }
OPPetriNetSimulationGUI class >> toolbarMenu: aBuilder [
	<opEditorToolbarMenu: #OPPetriNetsPlugin>
	self toolbarMenuItemFor: aBuilder
]

{ #category : #'private - hooks' }
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

{ #category : #'private - hooks' }
OPPetriNetSimulationGUI >> loadSimulation [

	"prepares simulation - called with every reload"

	super loadSimulation.
	diagramSimulator simulableElementsDo: [ :element | 
		element when: OPSimulatorDidAction do: [ :event | 
			event index = 2 ifTrue: [ 
				| controller prevColor |
				controller := self diagramController controllerForModel:
					              event simulator model.
				prevColor := controller roassalShape color.
				controller roassalShape color: Color lightOrange lighter.
				controller roassalShape signalUpdate.
				[ 
				(Delay forMilliseconds: 200) wait.
				controller roassalShape color = prevColor ifFalse: [ 
					controller roassalShape color: prevColor.
					controller roassalShape signalUpdate ] ] fork ] ] ]
]

{ #category : #'private - hooks' }
OPPetriNetSimulationGUI >> simulatorClass [
	^ OPPetriNetSimulator
]
