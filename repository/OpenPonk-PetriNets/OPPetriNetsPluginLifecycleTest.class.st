"
Verifies the initialization, registration, and shutdown lifecycle of the Petri Nets plugin.
"
Class {
	#name : 'OPPetriNetsPluginLifecycleTest',
	#superclass : 'OPAbstractPluginExampleLifecycleTest',
	#category : 'OpenPonk-PetriNets-Tests',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Tests'
}

{ #category : 'accessing' }
OPPetriNetsPluginLifecycleTest class >> pluginClass [
	"Answers the OPPlugin class under test."
	^ OPPetriNetsPlugin
]
