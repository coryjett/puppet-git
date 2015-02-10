#
# sudo puppet apply /vagrant/modules/puppet-git/examples/2.0.5.pp
#

class { 'git':
    version => '2.0.5'
}
