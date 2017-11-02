# openponk-petrinets
Petri nets diagrams for OpenPonk tool

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
