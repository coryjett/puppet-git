#
# cd examples
# sudo puppet apply 2.0.5.pp
#

class { 'git':
    version => '2.0.5'
}
