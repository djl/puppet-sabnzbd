# == Class: sabnzbd::service
class sabnzbd::service {
  if $::osfamily =~ /^Debian|RedHat/ {
    service { 'sabnzbd':
      ensure     => running,
      enable     => true,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
