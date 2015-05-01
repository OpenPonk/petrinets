private - accessing
arcsDo: aBlock
	"all connected arcs do aBlock"

	incoming do: aBlock.
	outgoing do: aBlock