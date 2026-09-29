"
Generates tests for loading legacy Petri Net projects to ensure backward compatibility.
"
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
