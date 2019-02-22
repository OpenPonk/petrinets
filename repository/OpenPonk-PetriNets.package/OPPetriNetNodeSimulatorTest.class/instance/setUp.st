running
setUp
	super setUp.
	model := self exampleModel.
	simulator := self controllerClass model: model