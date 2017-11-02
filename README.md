# OpenPonk: Petri nets
This repository adds Petri net diagrams to the OpenPonk tool. 

It allows crating places with tokens, transitions and arcs. Created Petri nets could be simulated in a random or user-picked order. Petri nets metamodel is included in the repository.

![example](http://www.mediafire.com/convkey/6324/fed28qgushayde6zg.jpg)

## Installation for usage

Requires Pharo 5 or greater.

In Playground, run following code:
```
Metacello new
    baseline: 'OpenPonkPetriNets';
    repository: 'github://bliznjan/openponk-petrinets/repository';
    load
```

## Installation for development

Requires Pharo 6.1 - image 60158 or greater.

1. Enable Iceberg Metacello integration in Iceberg settings
1. Clone the repository via Iceberg
1. Install default baseline BaselineOfOpenPonkPetriNets
