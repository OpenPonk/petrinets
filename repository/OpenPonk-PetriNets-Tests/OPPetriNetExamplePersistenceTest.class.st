"
Verifies the persistence and serialization integrity of bundled Petri Net example models.
"
Class {
	#name : 'OPPetriNetExamplePersistenceTest',
	#superclass : 'OPExamplePersistenceTest',
	#category : 'OpenPonk-PetriNets-Tests-Examples',
	#package : 'OpenPonk-PetriNets-Tests',
	#tag : 'Examples'
}

{ #category : 'hooks' }
OPPetriNetExamplePersistenceTest >> createExampleModel [

	^ OPPetriNetsExamples examplePetriNet
]
