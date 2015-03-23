userinterface
rebuild
	super rebuild.
	RTTreeLayout on: self view elements.
	self updateView.
	self view canvas camera focusOnCenter