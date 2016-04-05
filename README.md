# sumologic #

## Overview

Install and configure sumologic collector via JSON

## Module Description

- install sumologic from downloaded .sh package (.sh installer and puppet will remove all if net to server fail :-\)
- configure logs from hiera and JSON templates

## Usage

Add in site.pp like this:

### First run

```puppet
class {
  'sumologic::install':
}
```

### Reconfigure

```puppet
  class { 'sumologic::configure': } ->
  class { 'sumologic::restart': }
```


### Sample config for Hiera:

```yaml
sumologic::config:
  accessid: 'id'
  accesskey: 'key'
  sumoconf: 'sumo.conf'
  sumojson: 'sumo.json'
```

For add new log add it to *.json.erb (sumo.json.erb is default) and change Hiera parameter sumojson:

## Limitations

The module has been tested on:
* Puppet 3.8
* CentOS 6.5 x86_64
* Amazon Linux 6.x x86_64
