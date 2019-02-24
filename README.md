# OpenPonk: Petri nets

[![Build Status](https://travis-ci.org/JanBliznicenko/openponk-petrinets.svg?branch=master)](https://travis-ci.org/JanBliznicenko/openponk-petrinets)

This repository adds Petri net diagrams to the OpenPonk tool. 

It allows crating places with tokens, transitions and arcs. Created Petri nets could be simulated in a random or user-picked order. Petri nets metamodel is included in the repository.

![example](http://www.mediafire.com/convkey/6324/fed28qgushayde6zg.jpg)

## Installation for usage

Requires Pharo 6.1.

Slow loading with any image without OpenPonk: In Playground, run following code:
```
Metacello new
    baseline: 'OpenPonkPetriNets';
    repository: 'github://JanBliznicenko/openponk-petrinets/repository';
    load
```
Fast loading with OpenPonk image: Download OpenPonk 1.0.0 from https://openponk.org/, open it and in Playground, run following code:
```
	IceRepository reset.
	Metacello new
		baseline: 'OpenPonkPetriNets';
		repository: 'github://JanBliznicenko/openponk-petrinets/repository';
		onConflictUseLoaded;
		onWarning: [ :warning | 
			(warning isKindOf: MCMergeOrLoadWarning)
				ifTrue: [ warning load ]
				ifFalse: [ (warning messageText beginsWith: 'This package depends on the following classes')
						ifTrue: [ warning resume ]
						ifFalse: [ warning pass ] ] ];
		load
 ```

## Installation for development

Requires Pharo 6.1.

1. Update Iceberg using script for Pharo 6.1 on https://github.com/pharo-vcs/iceberg
1. Clone the repository via Iceberg
1. Install default baseline BaselineOfOpenPonkPetriNets
