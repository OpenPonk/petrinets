"
Verifies the persistence and serialization integrity of bundled Petri Net example models.
"
Class {
	#name : 'OPPetriNetExamplePersistenceTest',
	#superclass : 'OPExamplePersistenceTest',
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'hooks' }
OPPetriNetExamplePersistenceTest >> createExampleModel [

	^ OPPetriNetsExamples examplePetriNet
]
