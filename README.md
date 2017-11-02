# openponk-petrinets
This repository adds Petri net diagrams to the OpenPonk tool. Petri nets could be simulated in a random or user-picked order.

![example](http://www.mediafire.com/convkey/6324/fed28qgushayde6zg.jpg)

## Loading for usage

Requires Pharo 5 or greater.

In Playground, run following code:
```
Metacello new
    baseline: 'OpenPonkPetriNets';
    repository: 'github://bliznjan/openponk-petrinets/repository';
    load
```

## Loading for development

Requires Pharo 6.1 - image 60158 or greater.

In Playground, run following code:
```
Iceberg enableMetacelloIntegration.
Metacello new
    baseline: 'OpenPonkPetriNets';
    repository: 'github://bliznjan/openponk-petrinets/repository';
    load
```
