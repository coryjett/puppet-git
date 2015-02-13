#
# cd examples
# sudo puppet apply /etc/puppet/modules/git/examples/2.0.5.pp
#

class { 'git':
    version => '2.0.5'
}
