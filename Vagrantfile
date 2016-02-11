VM_IP = '10.10.0.70'
VM_NAME = 'Dev Server'
VM_HOSTNAME = 'dev.local'
VM_RAM = 2048
SYNC_TYPE = 'nfs'

BASE_DIRECTORY = File.expand_path(File.dirname(__FILE__))
SYMFONY_DIRECTORY = BASE_DIRECTORY + '/server/dev.local'
SYMFONY_REPOSITORY = 'https://github.com/symfony/symfony-standard.git'
SYMFONY_BRANCH = '3.0'

def colorize(text, color_code); "#{color_code}#{text}\033[0m"; end
def red(text); colorize(text, "\033[31m"); end
def yellow(text); colorize(text, "\033[33m"); end
def green(text); colorize(text, "\033[32m"); end
def bold(text); colorize(text, "\033[1;97m"); end

require 'mkmf'
has_fresh_repos = false

if !Dir.exists?(SYMFONY_DIRECTORY)
    if find_executable 'git'
        puts bold "Cloning Symfony repository ..."
        system "git clone #{SYMFONY_REPOSITORY} --branch #{SYMFONY_BRANCH} #{SYMFONY_DIRECTORY}"
        has_fresh_repos = true
    else
        raise "ERROR: Required #{SYMFONY_DIRECTORY} could not be found and no git executable was found to solve this problem."
    end
end

if has_fresh_repos
    puts yellow "Fresh repositories have been cloned"
    sleep 5
end


Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.hostname = VM_HOSTNAME
    config.vm.network :private_network, ip: VM_IP
    config.vm.synced_folder "./server", "/home/vagrant/server", type: SYNC_TYPE, create: true
    config.nfs.map_uid = Process.uid
    config.nfs.map_gid = Process.gid

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = 'puppet/manifests'
        puppet.module_path = 'puppet/modules'
        puppet.manifest_file = 'init.pp'
    end

    config.vm.provider :virtualbox do |vb|
        vb.name = VM_NAME
        vb.customize([
            "modifyvm", :id,
            "--memory", VM_RAM,
            "--cpus", 1,
            "--vram", 32
        ])
    end

end
