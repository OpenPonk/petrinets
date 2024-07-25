Class {
	#name : 'OPPetriNetsExamples',
	#superclass : 'Object',
	#category : 'OpenPonk-PetriNets-Examples',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Examples'
}

{ #category : 'examples' }
OPPetriNetsExamples class >> emptyModel [

	<script: 'self emptyModel inspect'>
	^ OPPetriNet new
		  name: 'New Petri Net';
		  yourself
]

{ #category : 'examples' }
OPPetriNetsExamples class >> examplePetriNet [

	<script: 'self examplePetriNet inspect'>
	| model place1 arc1 arc2 arc3 arc4 arc5 place2 place3 place4 trans1 trans2 |
	model := OPPetriNet named: 'Petri Net'.
	place1 := (OPPetriNetPTPlace named: 'P1')
		          tokens: 20;
		          yourself.
	place2 := OPPetriNetPTPlace named: 'P2'.
	place3 := OPPetriNetPTPlace named: 'P3'.
	place4 := (OPPetriNetPTPlace named: 'P4')
		          tokens: 1;
		          yourself.
	trans1 := OPPetriNetTransition named: 'T1'.
	trans2 := OPPetriNetTransition named: 'T2'.
	model
		add: place1;
		add: place2;
		add: place3;
		add: place4;
		add: trans1;
		add: trans2.
	arc1 := OPPetriNetNormalArc from: place1 to: trans1.
	arc2 := OPPetriNetInhibitorArc from: place2 to: trans1.
	arc3 := OPPetriNetNormalArc from: trans1 to: place3.
	arc4 := OPPetriNetResetArc from: place4 to: trans1.
	arc5 := OPPetriNetNormalArc from: trans2 to: place4.
	model
		add: arc1;
		add: arc2;
		add: arc3;
		add: arc4;
		add: arc5.
	^ model
]

{ #category : 'menu' }
OPPetriNetsExamples class >> menuCommandOn: aBuilder [

	<worldMenu>
	(aBuilder item: #'Petri Nets')
		icon: OPPetriNetsIcons petriNetIcon;
		action: [ self openExampleEmptyModel ];
		order: 215;
		with: [ 
			(aBuilder item: #'Petri Nets Example')
				parent: #'Petri Nets';
				label: 'Petri Nets example';
				icon: OPPetriNetsIcons petriNetIcon;
				action: [ self openExamplePetriNet ] ]
]

{ #category : 'examples' }
OPPetriNetsExamples class >> openExample: aModel [

	| project |
	project := OPProject named: 'FSM Example'.
	project addModel: aModel.
	^ (OPWorkbench openProject: project) showAllElementsInAllDiagrams
]

{ #category : 'examples' }
OPPetriNetsExamples class >> openExampleEmptyModel [

	<example>
	self openExample: self emptyModel
]

{ #category : 'examples' }
OPPetriNetsExamples class >> openExamplePetriNet [

	<example>
	self openExample: self examplePetriNet
]
