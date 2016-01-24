class { 'ohmyzsh': }

ohmyzsh::install { ['root', 'vagrant']: }

ohmyzsh::plugins { 'vagrant': plugins => 'git github' }
