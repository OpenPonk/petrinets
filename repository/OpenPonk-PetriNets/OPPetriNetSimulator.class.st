"
I'm simulator for Petri net diagram
"
Class {
	#name : 'OPPetriNetSimulator',
	#superclass : 'OPDiagramSimulator',
	#category : 'OpenPonk-PetriNets-Simulation',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Simulation'
}

{ #category : 'initialization' }
OPPetriNetSimulator class >> initialClassMapping [
	^ super initialClassMapping
		at: OPPetriNetNormalArc put: OPPetriNetNormalArcSimulator;
		at: OPPetriNetInhibitorArc put: OPPetriNetInhibitorArcSimulator;
		at: OPPetriNetResetArc put: OPPetriNetResetArcSimulator;
		at: OPPetriNetPTPlace put: OPPetriNetPlaceSimulator;
		at: OPPetriNetTransition put: OPPetriNetTransitionSimulator;
		yourself
]

{ #category : 'stepping' }
OPPetriNetSimulator >> setDefaultStepping [
	"sets default stepping settings"

	super setDefaultStepping.
	self
		fromSteppableElements;
		orderRandomized;
		selectFirst;
		resetActions;
		addAction: [ :item | item step ]
]

{ #category : 'stepping' }
OPPetriNetSimulator >> setSteppingAll [
	"sets stepping of all elements
	first removes tokens from all elements then places tokens to all elements"

	self
		setDefaultStepping;
		orderAny;
		selectAll
]
