removing
removeModel
	| ownerModel |
	ownerModel := self diagramController model.
	ownerModel remove: self model