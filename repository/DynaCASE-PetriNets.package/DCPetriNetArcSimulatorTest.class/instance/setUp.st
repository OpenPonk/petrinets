running
setUp
	super setUp.
	model := self exampleModel.
	simulator := self classForTesting model: model.
	place := DCPetriNetPlaceSimulator model: (DCPetriNetPlace new tokens: 10).
	trans := DCPetriNetTransitionSimulator model: DCPetriNetTransition new