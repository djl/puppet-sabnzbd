# == Class: sabnzbd::config
class sabnzbd::config {
  case $::osfamily {
    'Debian': { $default_file = '/etc/default/sabnzbd' }
    default: { fail("Unsupported OS: ${::osfamily}") }
  }

  file { $default_file:
    ensure  => present,
    content => template('sabnzbd/config.erb'),
    mode    => '0644',
  }
}
