define appserver::vhost() {
  file { "/etc/apache2/sites-available/${name}.conf":
      ensure  => present,
      content => template('appserver/template.erb'),
      require => [
        Package['apache2'],
        File["/home/vagrant/server/${name}/public_html"]
      ],
      notify  => Service['apache2'];
  }

  file { "/etc/apache2/sites-enabled/${name}.conf":
      ensure  => link,
      target  => "/etc/apache2/sites-available/${name}.conf",
      require => Package['apache2'],
      notify  => Service['apache2'];
  }
}
