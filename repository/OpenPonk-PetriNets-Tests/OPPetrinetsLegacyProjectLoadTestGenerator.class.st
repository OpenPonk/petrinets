"
Generates tests for loading legacy Petri Net projects to ensure backward compatibility.
"
Class {
	#name : 'OPPetrinetsLegacyProjectLoadTestGenerator',
	#superclass : 'OPLegacyProjectLoadTestGenerator',
	#category : 'OpenPonk-PetriNets-Tests-Examples',
	#package : 'OpenPonk-PetriNets-Tests',
	#tag : 'Examples'
}

{ #category : 'hooks' }
OPPetrinetsLegacyProjectLoadTestGenerator >> model [

	^ OPPetriNetsExamples examplePetriNet
]
