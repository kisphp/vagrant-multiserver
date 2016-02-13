class apache {
  package { ['apache2', 'apache2-mpm-prefork', 'apache2-utils', 'libapache2-mod-php5']:
    ensure => present
  }

  service { 'apache2':
    ensure  => running,
    require => Package['apache2'];
  }

  #apache::conf { ['apache2.conf', 'envvars', 'ports.conf']: }
  apache::module { ['rewrite.load']:
    require => Package['apache2']
  }

  file { '/etc/apache2/sites-enabled/000-default.conf':
    ensure => absent,
    require => Package['apache2'],
    notify => Service['apache2'],
  }

#  file { "/etc/apache2/apache2.conf":
#    source  => "puppet:///modules/apache/apache2.conf",
#    require => Package['apache2'],
#    notify  => Service['apache2'];
#  }
}
