Class {
	#name : 'OPPetriNetNormalArcController',
	#superclass : 'OPPetriNetWeightedArcController',
	#category : 'OpenPonk-PetriNets-Controllers',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Controllers'
}

{ #category : 'construction' }
OPPetriNetNormalArcController >> diagramElementClass [

	^ OPPetriNetNormalArcShape
]

{ #category : 'accessing' }
OPPetriNetNormalArcController >> modelClass [
	^ OPPetriNetNormalArc
]
