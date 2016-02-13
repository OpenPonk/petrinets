running
setUp
	super setUp.

	inc := DCPetriNetPlaceSimulator
		model:
			(DCPetriNetPlace new
				tokens: 4;
				yourself).
	(DCPetriNetNormalArcSimulator model: DCPetriNetNormalArc new)
		source: inc;
		target: simulator;
		yourself.

	out := DCPetriNetPlaceSimulator
		model:
			(DCPetriNetPlace new
				tokens: 4;
				yourself).
	(DCPetriNetNormalArcSimulator model: DCPetriNetNormalArc new)
		target: out;
		source: simulator;
		yourself