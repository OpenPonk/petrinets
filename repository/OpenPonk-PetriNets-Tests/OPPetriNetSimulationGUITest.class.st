"
Headless UI tests for the Petri Net simulation GUI presenter, simulation model command, and transition play-click integration. Verifies modular playback controls, save/reset and step-all behavior, highlighter flash delegation for transition actions, and window lifecycle cleanup.
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

	| buttons buttonsByLabel playPauseButton stepRandomButton stepAllButton |
	petriNet elements do: [ :eachElement | diagramController showInDiagramModel: eachElement ].

	simulationGui := OPPetriNetSimulationGUI diagramController: diagramController.
	self assert: simulationGui simulatorClass identicalTo: OPPetriNetSimulator.
	self assert: simulationGui supportsSavingState description: 'Petri net simulation GUI must advertise saving state'.
	self assert: simulationGui controlsPresenter showsDelayControl description: 'Step delay control must be shown'.

	buttons := simulationGui buttons.
	self assert: (buttons collect: #label as: Array) equals: #( 'Play (random)' 'Step (random)' 'Step (all)' 'Reset' 'Save state' ).

	buttonsByLabel := (buttons collect: [ :eachButton | eachButton label -> eachButton ]) asDictionary.
	playPauseButton := buttonsByLabel at: 'Play (random)'.
	stepRandomButton := buttonsByLabel at: 'Step (random)'.
	stepAllButton := buttonsByLabel at: 'Step (all)'.
	self assert: stepAllButton icon equals: (simulationGui iconNamed: #glamorousThrough).

	stepRandomButton performAction.
	self assert: sourcePlace tokens equals: 2.
	self assert: targetPlace tokens equals: 1.

	(buttonsByLabel at: 'Save state') performAction.
	stepAllButton performAction.
	self assert: sourcePlace tokens equals: 1.
	self assert: targetPlace tokens equals: 2.

	(buttonsByLabel at: 'Reset') performAction.
	self assert: sourcePlace tokens equals: 2.
	self assert: targetPlace tokens equals: 1.

	simulationGui session uiDispatcher: [ :aBlock | aBlock value ].
	simulationGui diagramSimulator delay: 5000.
	playPauseButton performAction.
	self assert: simulationGui session isRunning description: 'Clicking Play (random) must start simulation playback'.
	self assert: playPauseButton label equals: 'Pause'.
	self deny: stepRandomButton isEnabled description: 'Step (random) button must disable while simulation is running'.
	self deny: stepAllButton isEnabled description: 'Step (all) button must disable while simulation is running'.

	playPauseButton performAction.
	self deny: simulationGui session isRunning description: 'Clicking Pause must stop simulation playback'.
	self assert: playPauseButton label equals: 'Play (random)'.
	self assert: stepRandomButton isEnabled description: 'Step (random) button must re-enable after pausing'.
	self assert: stepAllButton isEnabled description: 'Step (all) button must re-enable after pausing'
]

{ #category : 'tests' }
OPPetriNetSimulationGUITest >> testEnabledTransitionHighlightAndTwoPhaseStepAnimation [

	| transitionController transitionShape originalBorderColor originalBorderWidth originalFill |
	petriNet elements do: [ :eachElement | diagramController showInDiagramModel: eachElement ].
	transitionController := diagramController controllerForModel: transition.
	transitionShape := transitionController roassalShape.
	originalBorderColor := transitionShape borderColor.
	originalBorderWidth := transitionShape border width.
	originalFill := transitionShape color.

	simulationGui := OPPetriNetSimulationGUI diagramController: diagramController.
	self assert: transitionShape borderColor equals: Color green darker.
	self assert: transitionShape border width equals: 2.
	self assert: transitionShape color equals: originalFill.

	simulationGui animator liveAnimationChecker: [ :canvas | canvas isNotNil ].
	simulationGui session step.
	self assert: simulationGui animator activeAnimation class identicalTo: RSSequentialAnimation.
	self assert: simulationGui animator activeAnimation animations size equals: 2.
	self assert: transitionShape color equals: Color lightOrange lighter.

	simulationGui session step.
	simulationGui session step.
	self assert: sourcePlace tokens equals: 0.
	self assert: transitionShape borderColor equals: Color green darker.
	simulationGui animator completeImmediately.
	self assert: transitionShape borderColor equals: originalBorderColor.
	self assert: transitionShape border width equals: originalBorderWidth.
	self assert: transitionShape color equals: originalFill.

	simulationGui close.
	simulationGui updateSimulationVisuals.
	self assert: transitionShape borderColor equals: originalBorderColor.
	self assert: transitionShape border width equals: originalBorderWidth
]

{ #category : 'tests' }
OPPetriNetSimulationGUITest >> testSimulationCommandActivationAndExecution [

	| activation toolContext command |
	activation := OPPetriNetSimulationCommand modelMenuActivation.
	self assert: activation class identicalTo: OPModelMenuActivation.

	editor instVarNamed: #diagramController put: diagramController.
	toolContext := CmdSimpleToolContext for: editor.
	command := OPPetriNetSimulationCommand new.
	self assert: command defaultMenuItemName equals: 'Simulation'.
	self assert: command defaultMenuIconName equals: #glamorousSpawn.

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
OPPetriNetSimulationGUITest >> testStepAllFiresAllEnabledTransitionsAndRestoresDefaultStepping [

	| secondSourcePlace secondTargetPlace secondTransition buttonsByLabel stepAllButton stepRandomButton |
	secondSourcePlace := (OPPetriNetPTPlace named: 'P3')
		                     tokens: 3;
		                     yourself.
	secondTargetPlace := OPPetriNetPTPlace named: 'P4'.
	secondTransition := OPPetriNetTransition named: 'T2'.
	petriNet
		add: secondSourcePlace;
		add: secondTargetPlace;
		add: secondTransition;
		add: (OPPetriNetNormalArc from: secondSourcePlace to: secondTransition);
		add: (OPPetriNetNormalArc from: secondTransition to: secondTargetPlace).
	petriNet elements do: [ :eachElement | diagramController showInDiagramModel: eachElement ].

	simulationGui := OPPetriNetSimulationGUI diagramController: diagramController.
	buttonsByLabel := (simulationGui buttons collect: [ :eachButton | eachButton label -> eachButton ]) asDictionary.
	stepAllButton := buttonsByLabel at: 'Step (all)'.
	stepRandomButton := buttonsByLabel at: 'Step (random)'.

	stepAllButton performAction.
	self assert: sourcePlace tokens equals: 2.
	self assert: targetPlace tokens equals: 1.
	self assert: secondSourcePlace tokens equals: 2.
	self assert: secondTargetPlace tokens equals: 1.

	stepRandomButton performAction.
	self assert: targetPlace tokens + secondTargetPlace tokens equals: 3.
	self assert: sourcePlace tokens + secondSourcePlace tokens equals: 3.

	simulationGui close.
	self assert: targetPlace tokens + secondTargetPlace tokens equals: 0.
	simulationGui stepAll.
	self assert: targetPlace tokens + secondTargetPlace tokens equals: 0.
	self assert: sourcePlace tokens + secondSourcePlace tokens equals: 6
]

{ #category : 'tests' }
OPPetriNetSimulationGUITest >> testStepIgnoresHiddenAndUnrenderedElementsSafely [

	| transitionController |
	simulationGui := OPPetriNetSimulationGUI diagramController: diagramController.
	simulationGui animator liveAnimationChecker: [ :canvas | canvas isNotNil ].

	simulationGui session step.
	self assert: sourcePlace tokens equals: 2.
	self assert: targetPlace tokens equals: 1.
	self assert: simulationGui animator activeAnimation identicalTo: nil.

	diagramController showInDiagramModel: sourcePlace.
	diagramController showInDiagramModel: targetPlace.
	transitionController := diagramController showInDiagramModel: transition.
	transitionController removeRender.

	simulationGui session step.
	self assert: sourcePlace tokens equals: 1.
	self assert: targetPlace tokens equals: 2.
	self assert: transitionController roassalShape identicalTo: nil
]

{ #category : 'tests' }
OPPetriNetSimulationGUITest >> testTransitionShapeHighlightPlayClickAndUnhighlight [

	| secondSourcePlace secondTargetPlace secondTransition transitionController transitionDiagramElement transitionShape originalColor originalBorderWidth selectableInteraction transitionHelper playIcon canvasShapes windowsCountAfterFirstClick |
	secondSourcePlace := (OPPetriNetPTPlace named: 'P3')
		                     tokens: 2;
		                     yourself.
	secondTargetPlace := OPPetriNetPTPlace named: 'P4'.
	secondTransition := OPPetriNetTransition named: 'T2'.
	petriNet
		add: secondSourcePlace;
		add: secondTargetPlace;
		add: secondTransition;
		add: (OPPetriNetNormalArc from: secondSourcePlace to: secondTransition);
		add: (OPPetriNetNormalArc from: secondTransition to: secondTargetPlace).
	petriNet elements do: [ :eachElement | diagramController showInDiagramModel: eachElement ].

	transitionController := diagramController controllerForModel: transition.
	transitionDiagramElement := transitionController diagramElement.
	transitionShape := transitionDiagramElement roassalShape.
	originalColor := transitionShape color.
	originalBorderWidth := transitionShape border width.
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
	self assert: secondSourcePlace tokens equals: 2.
	self assert: secondTargetPlace tokens equals: 0.
	self assert: transitionShape borderColor equals: Color green darker.

	simulationGui animator liveAnimationChecker: [ :canvas | canvas isNotNil ].
	windowsCountAfterFirstClick := self currentWorld submorphs count: [ :eachMorph | eachMorph isSystemWindow ].
	transitionHelper announce: RSMouseLeftClick new.
	self assert: (self currentWorld submorphs count: [ :eachMorph | eachMorph isSystemWindow ]) equals: windowsCountAfterFirstClick.
	self assert: sourcePlace tokens equals: 1.
	self assert: targetPlace tokens equals: 2.
	self assert: transitionShape color equals: Color lightOrange lighter.

	sourcePlace tokens: 0.
	transitionHelper announce: RSMouseLeftClick new.
	self assert: sourcePlace tokens equals: 0.
	self assert: targetPlace tokens equals: 2.

	selectableInteraction doUnhighlight: transitionShape.
	canvasShapes := diagramController canvas shapes.
	self denyCollection: canvasShapes includesAny: {
			transitionHelper.
			playIcon }.

	simulationGui close.
	self assert: transitionShape color equals: originalColor.
	self assert: transitionShape border width equals: originalBorderWidth
]
