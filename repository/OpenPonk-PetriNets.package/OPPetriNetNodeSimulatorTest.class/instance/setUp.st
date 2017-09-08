running
setUp
	super setUp.
	model := self exampleModel.
	simulator := self classForTesting model: model