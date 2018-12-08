construction
createModelIn: aParentModel
	model := self modelClass new.
	model source: self source model.
	model target: aParentModel.
	self source diagramController model add: model