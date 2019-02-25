hooks
createAdornment
	| icon transitionHelper |
	transitionHelper := RTBox new
		size: 20;
		color: Color white;
		borderColor: Color veryVeryLightGray;
		element.
	(RTConstraint on: transitionHelper background: figure)
		bottom;
		right;
		outer;
		stick.
	icon := RTSVGPath new
		path: 'M-5,6 L-5,-6 L5,0 L-5,6';
		color: (Color red: 50 green: 190 blue: 30);
		element.
	(RTConstraint on: icon background: transitionHelper) stick.
	transitionHelper
		when: TRMouseLeftClick
		do: [ :evt | OPPetriNetSimulationGUI stepSimulatorOfController: self ].
	figure
		when: OPTRFocused
		do: [ figure view
				add: transitionHelper;
				add: icon ].
	figure
		when: OPTRUnfocused
		do: [ transitionHelper view
				ifNotNil: [ transitionHelper remove.
					icon remove ] ]