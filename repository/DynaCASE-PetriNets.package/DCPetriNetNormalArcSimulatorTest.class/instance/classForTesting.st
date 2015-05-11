hooks
classForTesting
	^ DCPetriNetNormalArcSimulator
		model:
			(DCPetriNetNormalArc new
				weight: 2;
				yourself)