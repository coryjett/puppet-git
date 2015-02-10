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

  if defined(Package['curl']) == false {
    package { 'curl': ensure => present }
  }

  if defined(Package['libcurl4-openssl-dev']) == false {
    package { 'libcurl4-openssl-dev': ensure => present }
  }

  if defined(Package['libexpat1-dev']) == false {
    package { 'libexpat1-dev': ensure => present }
  }

  if defined(Package['gettext']) == false {
    package { 'gettext': ensure => present }
  }

  if defined(Package['libz-dev']) == false {
    package { 'libz-dev': ensure => present }
  }

  if defined(Package['libssl-dev']) == false {
    package { 'libssl-dev': ensure => present }
  }

  if defined(Package['build-essential']) == false {
    package { 'build-essential': ensure => present }
  }

  exec { "gitsources-get":
    command => "curl http://git-core.googlecode.com/files/git-${version}.tar.gz | tar xz",
    cwd     => "/tmp",
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    require => [Package['curl']]
  }

  exec { "gitsources-compile":
    command => "make prefix=/usr/local all",
    cwd     => "/tmp/git-${version}",
    path    => '/usr/bin:/bin:/usr/sbin:/sbin',
    require => [
      Exec["gitsources-get"],
      Package[
        "libcurl4-openssl-dev",
        "libexpat1-dev",
        "gettext",
        "libz-dev",
        "libssl-dev",
        "build-essential"
      ]
    ]
  }

  exec { "gitsources-install":
    command => "make prefix=/usr/local install",
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

