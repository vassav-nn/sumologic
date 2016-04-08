
class sumologic::restart {
  exec { 'restart collector':
    command => '/opt/SumoCollector/collector restart'
  }
}