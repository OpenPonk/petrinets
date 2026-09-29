"
Controller for Petri Net PT places.
Manages UI synchronization and diagram interactions for place nodes with token capacities.
"
Class {
	#name : 'OPPetriNetPTPlaceController',
	#superclass : 'OPPetriNetPlaceController',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPPetriNetPTPlaceController class >> diagramElementClass [

	^ OPPetriNetPTPlaceShape
]

{ #category : 'accessing' }
OPPetriNetPTPlaceController class >> viewModelClass [
	^ OPPetriNetPlaceViewModel
]

{ #category : 'announcements' }
OPPetriNetPTPlaceController >> subscribeToViewModel [

	super subscribeToViewModel.
	self viewModel announcer weak
		when: OPPlaceTokensChanged
		send: #modelChanged
		to: self
]
