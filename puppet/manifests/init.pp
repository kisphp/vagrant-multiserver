exec { 'apt-get-update':
    command => 'apt-get update',
    path => '/usr/bin',
}

#package { ['curl', 'tree', 'mc', 'make', 'wget', 'htop', 'build-essential', 'python', 'zsh']:
package { ['tree', 'mc']:
    ensure => present,
    require => Exec['apt-get-update'],
}

file { '/home/vagrant/server/':
    ensure => 'directory',
    require => Exec['apt-get-update'],
}

include vim, apache, appserver
#include vim, git, apache, php, mysql, appserver, nodejs, composer, ohmyzsh
