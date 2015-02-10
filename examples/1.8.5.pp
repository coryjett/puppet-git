#
# sudo puppet apply /vagrant/modules/puppet-git/examples/1.8.5.pp
#

class { 'git':
    version => '1.8.5'
}
