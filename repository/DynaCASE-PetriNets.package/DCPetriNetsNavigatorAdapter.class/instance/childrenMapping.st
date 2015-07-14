accessing
childrenMapping
	^ {
	DCPetriNet -> #elements.
	DCPetriNetArc -> #(#source #target).
	DCPetriNetNode -> #().
	}