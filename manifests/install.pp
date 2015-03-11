# == Class: sabnzbd::install
class sabnzbd::install() inherits sabnzbd::params {
  package { $sabnzbd::package_name:
    ensure => present,
  }

  if ($sabnzbd::manage_user) {
    user { $sabnzbd::user:
      ensure => present,
      shell  => $sabnzbd::user_shell,
      system => true,
      home   => $sabnzbd::data_dir,
    }
  }

  file { $sabnzbd::data_dir:
    ensure  => directory,
    mode    => '0755',
    owner   => $sabnzbd::user,
    group   => $sabnzbd::user,
    require => User[$sabnzbd::user]
  }
}
