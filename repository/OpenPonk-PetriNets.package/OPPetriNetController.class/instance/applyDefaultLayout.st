userinterface
applyDefaultLayout
	RTTreeLayout new
		doNotAttachPoint;
		on: self view elements.
	self updateView.
	self view canvas camera focusOnCenter