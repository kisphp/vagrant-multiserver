define appserver::www() {
  file {
    "/home/vagrant/server/${name}/":
      ensure  => directory,
      require => [
        Package['apache2'],
        File['/home/vagrant/server/'],
      ]
  }
  file {
    "/home/vagrant/server/${name}/public_html/":
      ensure  => directory,
      require => [
        Package['apache2'],
        File["/home/vagrant/server/${name}/"],
      ];
  }
}
