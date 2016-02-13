#class appserver {
#  appserver::www { ['dev.local']: }
#  appserver::vhost { ['dev.local']: }
#}

class appserver {
  appserver::www { ['rapo.local', 'companii.local']: }
  appserver::vhost { ['rapo.local', 'companii.local']: }
}
