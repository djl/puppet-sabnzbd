# == Class: sabnzbd::config
class sabnzbd::config {
  case $::osfamily {
    'Debian': { $config_file = '/etc/default/sabnzbd' }
    default: { fail("Unsupported OS: ${::osfamily}") }
  }

  file { $config_file:
    ensure  => present,
    content => template('sabnzbd/config.erb'),
    mode    => '0644',
  }
}
