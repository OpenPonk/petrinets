"
Model representing an inhibitor arc in a Petri Net.
Reverses the enabling logic: the target transition is enabled only if the source place has fewer tokens than the arc's weight.
"
Class {
	#name : 'OPPetriNetInhibitorArc',
	#superclass : 'OPPetriNetArc',
	#category : 'OpenPonk-PetriNets-Models',
	#package : 'OpenPonk-PetriNets',
	#tag : 'Models'
}
