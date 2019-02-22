hooks
controllerClass
	^ OPPetriNetNormalArcSimulator
		model:
			(OPPetriNetNormalArc new
				weight: 2;
				yourself)