# fcb_java

#### Table of Contents

1. [Overview](#overview)
1. [Module Description](#module-description)
1. [Setup](#setup)
1. [Usage](#usage)
1. [Hiera](#hiera)

## Overview

This module installs java on Windows or Linux platforms.  The init.pp makes use of OS.Name fact to simplify implementation and determine the proper way to install Java.

## Module Description

There are 2 core default yaml files used to configure Java. 
* Linux_defaults.yaml 
* windows_defaults.yaml

### Linux Install
The linux install uses the standard forge puppet module to install java:
```
https://forge.puppet.com/puppetlabs/java
```

The paramaters available are any of the valid parameters to the Java forge module.  

### Windows
The Windows installation makes use of custom install manifests as there was not an existing forge module for install Java on Windows.

## Setup
These fcb_java module prerequisites for this module to function properly.
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
The module hierarchy (hiera.yaml) is primarily used for setting defaults.

```
hierarchy:
  - name: "Linux Defaults"
    paths:
      - "linux_defaults.yaml"
  - name: "Windows Defaults"
    paths:
      - "windows_defaults.yaml"
```
### Linux Default - linux_defaults.yaml
The primary goal of this linux_defaults.yaml file is to avoid updating the forge module to set FCB specific defaults.  This will help future proof this module for updates to the forge module.  t
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
