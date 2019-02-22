tests
testCreateModel
	| createdModel |
	controller source: fromCtrl.
	controller target: toCtrl.
	fromCtrl createModelIn: diagramController model.
	toCtrl createModelIn: diagramController model.
	createdModel := controller createModelIn: diagramController model.
	self assert: createdModel class = self modelClass.
	self assert: createdModel source = fromCtrl model.
	self assert: createdModel target = toCtrl model