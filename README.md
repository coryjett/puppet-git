# Puppet Module
# `gajdaw/git`

#### Table of Contents

1. [Overview](#overview)
2. [Setup](#setup)
3. [Usage](#usage)
4. [Limitations](#limitations)
5. [Tests](#tests)

## 1. Overview

The module installs git by compiling sources.

## 2. Setup

To install the module run:

    sudo puppet install module gajdaw-git

## 3. Usage

To apply `git` class use the following command:

    sudo puppet apply -e 'include git'

You can also use example manifests:

    sudo puppet apply /etc/puppet/modules/git/examples/default.pp
    sudo puppet apply /etc/puppet/modules/git/examples/1.8.5.pp
    sudo puppet apply /etc/puppet/modules/git/examples/2.0.5.pp

## Limitations

You will find the exact information about supported platforms
in `metadata.json` file.

## Tests

Log of tests produced with [puppet-modules-factory](https://github.com/puppet-by-examples/puppet-modules-factory)
is available in [gh-pages branch](https://github.com/puppet-by-examples/puppet-git/tree/gh-pages/log).
