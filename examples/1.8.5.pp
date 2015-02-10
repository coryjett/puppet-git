#
# cd examples
# sudo puppet apply 1.8.5.pp
#

class { 'git':
    version => '1.8.5'
}
