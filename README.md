# OpenPonk: Petri nets

[![Build Status](https://travis-ci.com/OpenPonk/petrinets.svg?branch=master)](https://travis-ci.com/OpenPonk/petrinets)

This is an extension of [OpenPonk tool](https://openponk.org) that adds Petri net diagrams. 

It allows crating places with tokens, transitions and arcs. Created Petri nets could be simulated in a random or user-picked order. Petri nets metamodel is included in the repository.

![example](http://www.mediafire.com/convkey/6324/fed28qgushayde6zg.jpg)

## Installation

Requires Pharo 7 or 8 image - clean or with loaded OpenPonk.

In Playground, execute following script:
```
Metacello new
    baseline: 'PetriNets';
    repository: 'github://OpenPonk/petrinets/repository';
    load
```
