tests
testAdd
	| d first second t |
	super testAdd.
	self setUp.
	
	d := OPPetriNet new.
	self assert: d elements isEmpty.

	first := OPPetriNetTransition new name: '1'.
	d add: first.
	second := OPPetriNetPTPlace new name: '2'.
	d add: second.
	self assert: d elements size = 2.
	self assert: d elements first owner = d.

	t := OPPetriNetNormalArc from: d elements first to: d elements second.
	d add: t.
	self assert: d elements size = 3.
	self assert: d elements third owner = d