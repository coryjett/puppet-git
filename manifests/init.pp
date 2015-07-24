# Class: git
#
# This class installs git compiling it from sources
#
# Paremeters:
#
#   $version - the version as denoted in source filename
#
#
class git (
  $version = '2.3.0'
) {

  # validate_platform() function comes from
  # puppet module gajdaw/diverse_functions
  #
  #     https://forge.puppetlabs.com/gajdaw/diverse_functions
  #
  if !validate_platform($module_name) {
    fail("Platform not supported in module '${module_name}'.")
  }

  if defined(Package['curl']) == false {
    package { 'curl': ensure => present }
  }

  if defined(Package['gettext']) == false {
    package { 'gettext': ensure => present }
  }

  exec { 'yum Group Install':
    unless  => '/usr/bin/yum grouplist "Development tools" | /bin/grep "^Installed Groups"',
    command => '/usr/bin/yum -y groupinstall "Development tools"',
  }

  if defined(Package['git']) == false {
    package { 'git': ensure => present }
  }

  exec { 'gitsources-get':
    command => "git clone -b v${version} --depth 1 git://git.kernel.org/pub/scm/git/git.git /tmp/git-${version}",
    cwd     => '/tmp',
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    require => [Package['curl']]
  }

  exec { 'gitsources-compile':
    command => 'make prefix=/usr/local all',
    cwd     => "/tmp/git-${version}",
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    require => [
      Exec['gitsources-get'],
      Package[
        'libcurl4-openssl-dev',
        'libexpat1-dev',
        'gettext',
        'libz-dev',
        'libssl-dev',
        'build-essential'
      ]
    ]
  }

  exec { 'gitsources-install':
    command => 'make prefix=/usr/local install',
    cwd     => "/tmp/git-${version}",
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    require => [Exec['gitsources-compile']]
  }

  exec { 'gitsources-clean':
    command => "rm -rf /tmp/git-${version}",
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    require => [Exec['gitsources-install']]
  }

}

