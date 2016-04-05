# == Class: sumologic::params

class sumologic::params {
  $servconf = hiera('sumologic::config', 'nohiera')

  $accessid  = $servconf['accessid']
  $accesskey = $servconf['accesskey']
  $sumoconf  = $servconf['sumoconf']
  $sumojson  = $servconf['sumojson']
}
