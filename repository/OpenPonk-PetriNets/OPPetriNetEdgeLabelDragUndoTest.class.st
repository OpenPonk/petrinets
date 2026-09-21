Class {
	#name : 'OPPetriNetEdgeLabelDragUndoTest',
	#superclass : 'TestCase',
	#instVars : [
		'netModel',
		'sourcePlaceModel',
		'targetTransitionModel',
		'arcModel',
		'diagramController',
		'undoManager'
	],
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'running' }
OPPetriNetEdgeLabelDragUndoTest >> setUp [
	| project diagram registry canvas |
	super setUp.
	project := OPProject new.
	netModel := OPPetriNet new.
	netModel instVarNamed: #uuid put: UUID new.
	project addModel: netModel.

	sourcePlaceModel := OPPetriNetPTPlace new name: 'P1'.
	sourcePlaceModel instVarNamed: #uuid put: UUID new.
	targetTransitionModel := OPPetriNetTransition new name: 'T1'.
	targetTransitionModel instVarNamed: #uuid put: UUID new.
	arcModel := OPPetriNetNormalArc from: sourcePlaceModel to: targetTransitionModel.
	arcModel name: 'TestArc'.
	arcModel instVarNamed: #uuid put: UUID new.
	netModel add: sourcePlaceModel.
	netModel add: targetTransitionModel.
	netModel add: arcModel.

	registry := OPViewModelRegistry forProject: project.
	diagram := OPOpenPonkDiagram forModelElement: netModel.
	project addDiagram: diagram.

	canvas := RSCanvas new.
	diagramController := OPPetriNetController new.
	diagramController
		canvasPresenter: (OPCanvasPresenter new canvas: canvas; yourself);
		diagramElement: diagram;
		viewModelRegistry: registry;
		model: netModel.

	(diagramController showInDiagramModel: sourcePlaceModel) roassalShape position: 0 @ 0.
	(diagramController showInDiagramModel: targetTransitionModel) roassalShape position: 200 @ 0.
	diagramController showInDiagramModel: arcModel.

	undoManager := OPUndoManager new.
	diagramController undoManager: undoManager
]

{ #category : 'running' }
OPPetriNetEdgeLabelDragUndoTest >> tearDown [
	undoManager := nil.
	diagramController := nil.
	arcModel := nil.
	targetTransitionModel := nil.
	sourcePlaceModel := nil.
	netModel := nil.
	super tearDown
]

{ #category : 'tests' }
OPPetriNetEdgeLabelDragUndoTest >> testDragEdgeLabelCreatesUndoableChangeAnchoredBoundsCommand [
	| arcController labelElement labelShape canvas initialAnchor initialBalance initialDistance compositeCommand targetCommand |
	arcController := diagramController controllerForModel: arcModel.
	labelElement := arcController diagramElement ownedElements
		detect: [ :eachOwnedElement | eachOwnedElement isKindOf: OPEdgeLabel ]
		ifNone: [ self fail: 'OPEdgeLabel was not found among owned elements of arc diagram element' ].
	labelShape := labelElement roassalShape.
	canvas := diagramController canvas.

	initialAnchor := labelShape propertyAt: OPRSAnchorConstraint ifAbsent: [ nil ].
	self assert: initialAnchor isNotNil.
	initialBalance := initialAnchor balance.
	initialDistance := initialAnchor distanceToLine.

	labelShape announce: (RSMouseDragStart new
		position: labelShape position;
		shape: labelShape;
		canvas: canvas;
		yourself).
	labelShape announce: (RSMouseDragging new
		step: 30 @ 40;
		position: labelShape position + (30 @ 40);
		shape: labelShape;
		canvas: canvas;
		yourself).
	labelShape announce: (RSMouseDragEnd new
		position: labelShape position + (30 @ 40);
		shape: labelShape;
		canvas: canvas;
		yourself).

	self assert: undoManager canUndo.
	self assert: undoManager undoStack size equals: 1.
	compositeCommand := undoManager undoStack first.
	self assert: compositeCommand class equals: OPCompositeCommand.
	self assert: compositeCommand commands size equals: 1.

	targetCommand := compositeCommand commands first.
	self assert: targetCommand class equals: OPChangeAnchoredBoundsCommand.
	self assert: targetCommand oldBalance equals: initialBalance.
	self assert: targetCommand oldDistanceToLine equals: initialDistance.

	undoManager undo.
	self assert: (labelShape propertyAt: OPRSAnchorConstraint) balance equals: initialBalance.
	self assert: (labelShape propertyAt: OPRSAnchorConstraint) distanceToLine equals: initialDistance.

	undoManager redo.
	self deny: (labelShape propertyAt: OPRSAnchorConstraint) balance equals: initialBalance.
	self deny: (labelShape propertyAt: OPRSAnchorConstraint) distanceToLine equals: initialDistance
]
