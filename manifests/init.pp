# == Class: sabnzbd
#
# Install SABnzbd
#
# === Parameters
#
# [*install_dir*]
#   Where SABnzbd should be installed
#
# [*data_dir*]
#   The directory containing data created by SABnzbd
#
# [*user*]
#   The user SABnzbd should run as
#
# [*user_shell*]
#   The SABnzbd user's shell
#
# [*address*]
#   The address SABnzbd should listening on
#
# [*port*]
#   The port number SABnzbd should be running on
#
# [*pidfile*]
#   The pidfile for the SABnzbd process
#
# [*repo*]
#   The upstream git repo from which SABnzbd will be installed
#
# === Examples
#
#  class { 'sabnzbd':
#    user => 'jim',
#  }
#
#
class sabnzbd (
  $user        = $sabnzbd::params::user,
  $user_shell  = $sabnzbd::params::user_shell,
  $manage_user = $sabnzbd::params::manage_user,
  $data_dir    = $sabnzbd::params::data_dir,
  $address     = $sabnzbd::params::address,
  $port        = $sabnzbd::params::port,
) inherits sabnzbd::params {

  validate_bool($manage_user)

  class { 'sabnzbd::install': } ->
  class { 'sabnzbd::config': } ~>
  class { 'sabnzbd::service': } ->
  Class['sabnzbd']
}
