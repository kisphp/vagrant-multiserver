## Requirements

- Mac OS X or Ubuntu Desktop
- Vagrant 1.7.2
- VirtualBox >= 4.3.30

## Installation

```bash
# clone vagrant VM
git clone https://github.com/kisphp/vagrant-multiserver.git dev.server

# go into vm directory
cd dev.server

# create virtual machine
vagrant up

# login inside virtual machine
vagrant ssh

# go to project directory
cd server/dev.local

# add vagrant repository to ignore list in your project
echo "_vm/" >> .gitignore 

# install dependencies
composer install

```

Composer will require interaction to build `parameters.yml` file.

## Ubuntu host fixes 
```bash
sudo apt-get install nfs-kernel-server
```

### Installed Packages in VM

- build-essential
- composer
- curl
- git
- htop
- imagemagick
- mc
- mcrypt
- make
- memcached
- mysql
- nginx
- ohmyzsh
- php
    - php5-fpm
    - php5-gd
    - php5-mysql
    - php5-cli
    - php-pear
    - php5-mcrypt
    - php5-imagick
    - php5-curl
    - php5-memcache
    - php5-memcached
    - php5-sqlite
- python
- redis
- tree
- vim
- wget

### MySQL credentials

```
DATABASE_USERNAME = developer
DATABASE_PASSWORD = develop123
DATABASE_NAME = development
```

## Redis

> Redis requires no credentials to login
