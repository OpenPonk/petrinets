hooks
refreshFigure
	self
		figureLabel: #name text: self model name;
		figureLabel: #weight text: self weightText.
	super refreshFigure