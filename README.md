# `gajdaw-git` Puppet Module

#### Table of Contents

1. [Overview](#overview)
2. [Setup](#setup)
3. [Usage](#usage)
4. [Limitations](#limitations)
5. [Development](#development)
6. [How do I test the module?](#how-do-i-test-the-module)

## Overview

This module installs installs git using sources.

## Setup

To install the module run:

    sudo puppet install module gajdaw-git

## Usage

You can use the module running:

    sudo puppet apply -e 'include git'

To install arbitrary version use `version` parameter.
The examples how to do it are stored in `examples` directory.



## Limitations

## Limitations

The module was tested on all the platforms that appear in `metadata.json`.

The results of tests are available in
[test-output.txt](https://github.com/puppet-by-examples/puppet-git/blob/master/test-output.txt) file.

## Development

For development instructions visit
[Puppet Modules Factory](https://github.com/puppet-by-examples/puppet-modules-factory)

