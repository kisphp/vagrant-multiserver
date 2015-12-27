class nginx {

  package { 'nginx':
    ensure => 'present',
    require => Exec['apt-get-update'],
  }

  service { 'nginx':
    ensure => running,
    require => Package['nginx'],
  }

  file { 'vagrant-nginx-dev':
    path => '/etc/nginx/sites-available/dev.local',
    ensure => file,
    require => Package['nginx'],
    source => 'puppet:///modules/nginx/dev.local',
  }

  file { 'vagrant-nginx-kp':
    path => '/etc/nginx/sites-available/kp.local',
    ensure => file,
    require => Package['nginx'],
    source => 'puppet:///modules/nginx/kp.local',
  }

  file { 'srv-directory':
    path => '/etc/nginx/srv/',
    ensure => directory,
    require => Package['nginx'],
  }

  file { 'srv-file':
    path => '/etc/nginx/srv/sites.conf',
    ensure => file,
    require => File['srv-directory'],
    source => 'puppet:///modules/nginx/srv/sites.conf',
  }

  file { 'default-nginx-disable':
    path => '/etc/nginx/sites-enabled/default',
    ensure => absent,
    notify => Service['nginx'],
    require => Package['nginx'],
  }

file { 'default-nginx-config-disable':
    path => '/etc/nginx/sites-available/default',
    ensure => absent,
    require => Package['nginx'],
  }

file { 'vagrant-nginx-enable-dev':
    path => '/etc/nginx/sites-enabled/dev.local',
    target  => '/etc/nginx/sites-available/dev.local',
    ensure => link,
    notify => Service['nginx'],
    require => [
      File['vagrant-nginx-dev'],
      File['default-nginx-disable'],
    ],
  }

  file { 'vagrant-nginx-enable-kp':
    path => '/etc/nginx/sites-enabled/kp.local',
    target  => '/etc/nginx/sites-available/kp.local',
    ensure => link,
    notify => Service['nginx'],
    require => [
      File['vagrant-nginx-kp'],
      File['default-nginx-disable'],
    ],
  }
}
