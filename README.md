# fcb_java

#### Table of Contents

1. [Overview](#overview)
1. [Module Description](#module-description)
1. [Setup](#setup)
1. [Usage](#usage)
1. [Hiera](#hiera)

## Overview

This module installs java on Windows or Linux platforms.  The init.pp makes use of OS.Name fact to determine the proper way to install Java.

## Module Description

There are 2 core default yaml files used to configure Java. 
### Linux_defaults.yaml The merge stragey desired for this module is configured in the merge.yaml, and most effective way to set configuration in Hiera is a deep merge stategy to help minimize duplicate configuration.  For configuration items that apply to all systems or a majority of systems then defaults.yaml should be used for setting items in hiera.  If there is a need to override something in defaults then setting values in a more specific Hiera yaml will override anything in defaults.yaml based on a deep merge strategy.  The primary goal here is to minimize the number of places that things have to be configured in Hiera.  

### Linux Install
The linux install uses the standard forge puppet module to install java:
```
https://forge.puppet.com/puppetlabs/java
```

The paramaters are

### Windows
The Windows installation makes use of custom install manifests as there was not an existing forge module for install Java on Windows.

## Setup
```
puppet module install puppetlabs-java --version 6.3.0
puppet module install puppetlabs-dsc --version 1.9.3
puppet module install puppetlabs-powershell --version 2.3.0
```
## Usage
```
node default {
  include fcb_java
}
```

## Hiera
The module hiera.yaml
```
---
version: 5

defaults:
  datadir: data
  data_hash: yaml_data

hierarchy:
  - name: "Linux Defaults"
    paths:
      - "linux_defaults.yaml"
  - name: "Windows Defaults"
    paths:
      - "windows_defaults.yaml"
```
### Linux Default - defaults.yaml
```
java::distribution: 'jre'
java::package: 'java-1.8.0-openjdk-devel'
```
### Windows Default - windows_defaults.yaml
```
fcb_java::windows::url: 'https://larkfileshare.blob.core.windows.net/jdk'
fcb_java::windows::destination_path: 'c:/larktemp'
fcb_java::windows::install_version: '8u231'
fcb_java::windows::registry_name: 'Java SE Development Kit 8 Update 231 (64-bit)'
fcb_java::windows::java_home: 'C:\Program Files\Java\jdk1.8.0_231'
fcb_java::windows::jre_home: 'C:\Program Files\Java\jre1.8.0_231'
```
