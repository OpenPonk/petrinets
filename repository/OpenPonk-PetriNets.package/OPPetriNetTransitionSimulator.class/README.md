I simulate Petri net place transition.
I am simulable.

Firing:
First I tell incoming arcs to move tokens from their input places to me and then I tell outgoing arcs to move tokens from me to their output places.

    Instance Variables
	firing:		tells whether started firing but did not complete yet
	tempTokens:		tokens temporarily saved her while firing