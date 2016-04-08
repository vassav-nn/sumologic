# Class: sumologic::install
#
# Install sumologic collector
#

class sumologic::install inherits sumologic::params {

  exec { 'collector no exists':
    command => '/bin/false',
    unless  => '/usr/bin/test ! -e /opt/SumoCollector/collector'
  } ->

  # Workdir
#  notify {"--- Install SumoCollector ---":}
  file { '/opt/SumoCollector':
    ensure => 'directory'
  } ->

  exec { 'Download SumoCollector':
    require   => Exec['collector no exists'],
    command   => '/usr/bin/wget --no-check-certificate https://collectors.sumologic.com/rest/download/linux/64 -O /opt/SumoCollector_linux64.sh',
    timeout   => 6000,
    logoutput => false
  }

  # precreate configs
  class { 'sumologic::configure': } ->

  # Install
  exec { 'Install SumoCollector':
    require   => Exec['Download SumoCollector'],
    command   => '/bin/sh /opt/SumoCollector_linux64.sh -q -dir /opt/SumoCollector',
    timeout   => 600,
    logoutput => false
  }

  exec { 'start collector':
    command => '/opt/SumoCollector/collector restart'
  }
}