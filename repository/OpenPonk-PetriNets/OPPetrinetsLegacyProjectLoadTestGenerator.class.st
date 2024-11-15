Class {
	#name : 'OPPetrinetsLegacyProjectLoadTestGenerator',
	#superclass : 'OPLegacyProjectLoadTestGenerator',
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'hooks' }
OPPetrinetsLegacyProjectLoadTestGenerator >> model [

	^ OPPetriNetsExamples examplePetriNet
]
