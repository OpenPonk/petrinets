"
Tests for the Petri Net simulation GUI presenter, simulation model command, and transition play-click integration.
Verifies deterministic simulation controls, event display guards for hidden or unrendered transitions, and window lifecycle cleanup.
"
Class {
	#name : 'OPPetriNetSimulationGUITest',
	#superclass : 'OPAbstractUITest',
	#instVars : [
		'openWindowsBefore',
		'petriNet',
		'sourcePlace',
		'targetPlace',
		'transition',
		'editor',
		'diagramController',
		'simulationGui'
	],
	#category : 'OpenPonk-PetriNets-Tests-Simulation',
	#package : 'OpenPonk-PetriNets-Tests',
	#tag : 'Simulation'
}

{ #category : 'running' }
OPPetriNetSimulationGUITest >> buildPetriNetModel [

	petriNet := OPPetriNet named: 'Simulation Net'.
	sourcePlace := (OPPetriNetPTPlace named: 'P1')
		               tokens: 3;
		               yourself.
	targetPlace := OPPetriNetPTPlace named: 'P2'.
	transition := OPPetriNetTransition named: 'T1'.
	petriNet
		add: sourcePlace;
		add: targetPlace;
		add: transition;
		add: (OPPetriNetNormalArc from: sourcePlace to: transition);
		add: (OPPetriNetNormalArc from: transition to: targetPlace)
]

{ #category : 'running' }
OPPetriNetSimulationGUITest >> setUp [

	| project diagram projectController plugin |
	super setUp.
	openWindowsBefore := (self currentWorld submorphs select: [ :eachMorph | eachMorph isSystemWindow ]) asIdentitySet.
	self buildPetriNetModel.
	project := OPProject named: 'Petri Net Simulation Test'.
	project addModel: petriNet.
	diagram := OPOpenPonkDiagram forModelElement: petriNet.
	project addDiagram: diagram.
	projectController := OPProjectController forProject: project.
	plugin := OPPluginRegistry default plugins detect: [ :eachPlugin | eachPlugin isKindOf: OPPetriNetsPlugin ].
	editor := OPEditor on: plugin.
	diagramController := OPPetriNetController new.
	projectController addDiagramController: diagramController.
	diagramController
		editor: editor;
		canvasPresenter: (OPCanvasPresenter new
				 canvas: RSCanvas new;
				 yourself);
		diagramElement: diagram;
		model: petriNet
]

{ #category : 'running' }
OPPetriNetSimulationGUITest >> tearDown [

	(simulationGui isNotNil and: [ simulationGui isOpen ]) ifTrue: [ simulationGui close ].
	self currentWorld submorphs
		select: [ :eachMorph | eachMorph isSystemWindow and: [ (openWindowsBefore includes: eachMorph) not ] ]
		thenDo: [ :eachWindow | eachWindow delete ].
	simulationGui := nil.
	diagramController := nil.
	editor := nil.
	petriNet := nil.
	sourcePlace := nil.
	targetPlace := nil.
	transition := nil.
	openWindowsBefore := nil.
	super tearDown
]

{ #category : 'tests' }
OPPetriNetSimulationGUITest >> testButtonItemsAndDeterministicActions [

	| buttonItems buttonsByLabel |
	petriNet elements do: [ :eachElement | diagramController showInDiagramModel: eachElement ].

	simulationGui := OPPetriNetSimulationGUI diagramController: diagramController.
	self assert: simulationGui simulatorClass identicalTo: OPPetriNetSimulator.

	buttonItems := simulationGui buttonItems.
	self
		assert: (buttonItems collect: #label as: Array)
		equals: #( 'Save state' 'Stop + Load state' 'Pause' 'Play (random)' 'Step (random)' 'Step (all)' ).

	buttonsByLabel := (buttonItems collect: [ :eachButton | eachButton label -> eachButton ]) asDictionary.

	(buttonsByLabel at: 'Step (random)') performAction.
	self assert: sourcePlace tokens equals: 2.
	self assert: targetPlace tokens equals: 1.

	(buttonsByLabel at: 'Save state') performAction.
	(buttonsByLabel at: 'Step (all)') performAction.
	self assert: sourcePlace tokens equals: 1.
	self assert: targetPlace tokens equals: 2.

	(buttonsByLabel at: 'Stop + Load state') performAction.
	self assert: sourcePlace tokens equals: 2.
	self assert: targetPlace tokens equals: 1.

	(buttonsByLabel at: 'Pause') performAction.
	self
		deny: (simulationGui diagramSimulator instVarNamed: #shouldRun)
		description: 'Pause button must stop simulation running flag'
]

{ #category : 'tests' }
OPPetriNetSimulationGUITest >> testDisplayEventHighlightsVisibleTransitionAndIgnoresOtherActionIndices [

	| transitionController transitionShape originalColor transitionSimulator firstActionEvent secondActionEvent |
	diagramController showInDiagramModel: sourcePlace.
	diagramController showInDiagramModel: targetPlace.
	transitionController := diagramController showInDiagramModel: transition.
	transitionShape := transitionController roassalShape.
	originalColor := transitionShape color.

	simulationGui := OPPetriNetSimulationGUI diagramController: diagramController.
	transitionSimulator := simulationGui diagramSimulator simulatorOf: transition.

	firstActionEvent := OPSimulatorDidAction simulator: transitionSimulator action: [ :each | each ] index: 1.
	simulationGui displayEvent: firstActionEvent.
	self assert: transitionShape color equals: originalColor.

	secondActionEvent := OPSimulatorDidAction simulator: transitionSimulator action: [ :each | each ] index: 2.
	simulationGui displayEvent: secondActionEvent.
	self assert: transitionShape color equals: Color lightOrange lighter
]

{ #category : 'tests' }
OPPetriNetSimulationGUITest >> testDisplayEventIgnoresHiddenTransitionAndUnrenderedShape [

	| transitionSimulator actionEvent transitionController |
	simulationGui := OPPetriNetSimulationGUI diagramController: diagramController.
	transitionSimulator := simulationGui diagramSimulator simulatorOf: transition.
	actionEvent := OPSimulatorDidAction simulator: transitionSimulator action: [ :each | each ] index: 2.

	simulationGui diagramSimulator step.
	self assert: sourcePlace tokens equals: 2.
	self assert: targetPlace tokens equals: 1.

	diagramController showInDiagramModel: sourcePlace.
	diagramController showInDiagramModel: targetPlace.
	transitionController := diagramController showInDiagramModel: transition.
	transitionController removeRender.

	simulationGui displayEvent: actionEvent.
	self assert: transitionController roassalShape identicalTo: nil
]

{ #category : 'tests' }
OPPetriNetSimulationGUITest >> testSimulationCommandActivationAndExecution [

	| activation toolContext command |
	activation := OPPetriNetSimulationCommand modelMenuActivation.
	self assert: activation class identicalTo: OPModelMenuActivation.

	editor instVarNamed: #diagramController put: diagramController.
	toolContext := CmdSimpleToolContext for: editor.
	command := OPPetriNetSimulationCommand new.
	command
		readParametersFromContext: toolContext;
		prepareFullExecutionInContext: toolContext;
		execute.

	simulationGui := OPPetriNetSimulationGUI allInstances
		                 detect: [ :eachGui | eachGui isOpen and: [ eachGui diagramController == diagramController ] ]
		                 ifNone: [ self fail: 'Executing OPPetriNetSimulationCommand must open OPPetriNetSimulationGUI' ].
	self assert: simulationGui diagramModel identicalTo: petriNet
]

{ #category : 'tests' }
OPPetriNetSimulationGUITest >> testTransitionShapeHighlightPlayClickAndUnhighlight [

	| transitionController transitionDiagramElement transitionShape selectableInteraction transitionHelper playIcon canvasShapes |
	petriNet elements do: [ :eachElement | diagramController showInDiagramModel: eachElement ].

	transitionController := diagramController controllerForModel: transition.
	transitionDiagramElement := transitionController diagramElement.
	transitionShape := transitionDiagramElement roassalShape.
	selectableInteraction := transitionShape propertyAt: OPRSSelectable.
	transitionHelper := transitionDiagramElement instVarNamed: #transitionHelper.
	playIcon := transitionDiagramElement instVarNamed: #icon.

	selectableInteraction doHighlight: transitionShape.
	canvasShapes := diagramController canvas shapes.
	self assertCollection: canvasShapes includesAll: {
			transitionHelper.
			playIcon }.

	transitionHelper announce: RSMouseLeftClick new.
	simulationGui := OPPetriNetSimulationGUI allInstances
		                 detect: [ :eachGui | eachGui isOpen and: [ eachGui diagramController == diagramController ] ]
		                 ifNone: [ self fail: 'Clicking play icon on transition shape must open OPPetriNetSimulationGUI' ].
	self assert: sourcePlace tokens equals: 2.
	self assert: targetPlace tokens equals: 1.

	selectableInteraction doUnhighlight: transitionShape.
	canvasShapes := diagramController canvas shapes.
	self denyCollection: canvasShapes includesAny: {
			transitionHelper.
			playIcon }
]
