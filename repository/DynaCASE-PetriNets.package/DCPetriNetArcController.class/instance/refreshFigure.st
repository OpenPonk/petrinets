hooks
refreshFigure
	self figureLabel: #name text: self model name.
	self figureLabel: #weight text: self weightText.
	super refreshFigure