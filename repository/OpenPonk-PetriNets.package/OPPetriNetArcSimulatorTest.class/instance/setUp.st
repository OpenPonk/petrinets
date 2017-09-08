running
setUp
	super setUp.
	model := self exampleModel.
	simulator := self classForTesting model: model.
	place := OPPetriNetPlaceSimulator model: (OPPetriNetPlace new tokens: 10).
	trans := OPPetriNetTransitionSimulator model: OPPetriNetTransition new