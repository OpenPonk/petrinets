running
setUp
	super setUp.

	inc := OPPetriNetPlaceSimulator
		model:
			(OPPetriNetPTPlace new
				tokens: 4;
				yourself).
	(OPPetriNetNormalArcSimulator model: OPPetriNetNormalArc new)
		source: inc;
		target: simulator;
		yourself.

	out := OPPetriNetPlaceSimulator
		model:
			(OPPetriNetPTPlace new
				tokens: 4;
				yourself).
	(OPPetriNetNormalArcSimulator model: OPPetriNetNormalArc new)
		target: out;
		source: simulator;
		yourself