running
setUp
	super setUp.
	model := self exampleModel.
	simulator := self controllerClass model: model.
	place := OPPetriNetPlaceSimulator model: (OPPetriNetPTPlace new tokens: 10).
	trans := OPPetriNetTransitionSimulator model: OPPetriNetTransition new