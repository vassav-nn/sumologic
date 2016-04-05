# == Class: sumologic::config

class sumologic::config (
  $accessid  = $sumologic::params::accessid,
  $accesskey = $sumologic::params::accesskey,
  $sumoconf  = $sumologic::params::sumoconf,
  $sumojson  = $sumologic::params::sumojson,
) inherits sumologic::params {
}