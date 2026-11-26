# OpenPonk: Petri Nets

[![Nightly](https://github.com/OpenPonk/petrinets/actions/workflows/nightly.yml/badge.svg)](https://github.com/OpenPonk/petrinets/actions/workflows/nightly.yml) [![Coverage Status](https://coveralls.io/repos/github/OpenPonk/petrinets/badge.svg?branch=master)](https://coveralls.io/github/OpenPonk/petrinets?branch=master)

Place/Transition Petri Nets metamodel, diagram editor, and token-firing simulator for the [OpenPonk](https://openponk.org) modeling platform.

## Download

Download pre-built portable archives from [Releases](https://github.com/OpenPonk/petrinets/releases), or get the all-in-one build at [openponk.org/#download](https://openponk.org/#download).

## Installation

See [openponk.org/#direct-installation](https://openponk.org/#direct-installation) for the supported Pharo version.

```smalltalk
Metacello new
	baseline: 'OpenPonkPetriNets';
	repository: 'github://OpenPonk/petrinets';
	load.
```

## Documentation

Part of the [OpenPonk](https://openponk.org) platform. For architecture, the repository catalog, and contributing guidelines, see [`OpenPonk/.github`](https://github.com/OpenPonk/.github/blob/main/profile/README.md).
