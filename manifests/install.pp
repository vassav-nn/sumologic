# Class: sumologic::install
#
# Install sumologic collector
#

class sumologic::install inherits sumologic::params {

  exec { "collector_no_exists":
    command => '/bin/false',
    unless => '/usr/bin/test ! -e /opt/SumoCollector/collector'
  } ->

  # Workdir
#  notify {"--- Install SumoCollector ---":}
  file { "/opt/SumoCollector":
    ensure => 'directory'
  } ->

  exec { "Download SumoCollector":
    require => exec [ "collector_no_exists" ],
    command => "/usr/bin/wget https://collectors.sumologic.com/rest/download/linux/64 -O /opt/SumoCollector/SumoCollector_linux64.sh",
    timeout => 6000,
    logoutput => false
  }

  # precreate configs
  class { 'sumologic::configure': } ->

  # Install
  exec { "Install SumoCollector":
    require => exec [ "Download SumoCollector" ],
    command => "/bin/sh /opt/SumoCollector/SumoCollector_linux64.sh -q -dir /opt/SumoCollector",
    timeout => 600,
    logoutput => false
  }

  exec { "start collector":
    command => "/opt/SumoCollector/collector restart"
  }
}