# == Class: sumologic::configure
#
# Configure sumologic logs
#

class sumologic::configure inherits sumologic::params {

  # recreate configs
  file { '/etc/sumo.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template("sumologic/${sumoconf}.erb")
  } ->
  
  file { '/etc/user.properties':
    ensure => 'link',
    target => '/etc/sumo.conf'
  } ->
  
  file { '/etc/sumo.json':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template("sumologic/${sumojson}.erb")
  }
}