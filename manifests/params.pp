# == Class: sabnzbd::params
class sabnzbd::params {
  $package_name = 'sabnzbd'
  $user         = 'sabnzbd'
  $user_shell   = '/bin/false'
  $manage_user  = true
  $data_dir     = '/var/lib/sabnzbd'
  $address      = '0.0.0.0'
  $port         = '8080'
}
