"
View model for Petri Net normal arcs.
Handles model attachment logic and provides naming specifications for the UI layer.
"
Class {
	#name : 'OPPetriNetNormalArcViewModel',
	#superclass : 'OPPetriNetWeightedArcViewModel',
	#category : 'OpenPonk-PetriNets-ViewModels',
	#package : 'OpenPonk-PetriNets',
	#tag : 'ViewModels'
}

{ #category : 'accessing' }
OPPetriNetNormalArcViewModel class >> modelClass [ ^ OPPetriNetNormalArc
]

{ #category : 'construction' }
OPPetriNetNormalArcViewModel >> attachModelFrom: sourceViewModel to: targetViewModel [
	self model source: sourceViewModel model.
	self model target: targetViewModel model.
]

{ #category : 'accessing' }
OPPetriNetNormalArcViewModel >> nameOfType [

	^ 'Arc'
]
