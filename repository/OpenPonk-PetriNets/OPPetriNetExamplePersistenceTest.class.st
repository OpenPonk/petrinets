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
