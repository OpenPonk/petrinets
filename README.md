# OpenPonk: Petri nets

[![Nightly](https://github.com/OpenPonk/petrinets/actions/workflows/nightly.yml/badge.svg)](https://github.com/OpenPonk/petrinets/actions/workflows/nightly.yml) 

This is an extension of [OpenPonk tool](https://openponk.org) that adds Petri net diagrams. 

It allows crating places with tokens, transitions and arcs. Created Petri nets could be simulated in a random or user-picked order. Petri nets metamodel is included in the repository.

![example](http://www.mediafire.com/convkey/6324/fed28qgushayde6zg.jpg)

## Installation

Requires Pharo 12 image - clean or with loaded OpenPonk.

In Playground, execute following script:
```
Metacello new
    baseline: 'OpenPonkPetriNets';
    repository: 'github://OpenPonk/petrinets/repository';
    load
```
