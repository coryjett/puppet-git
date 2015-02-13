#
# sudo puppet apply /etc/puppet/modules/git/examples/1.8.5.pp
#

class { 'git':
    version => '1.8.5'
}
