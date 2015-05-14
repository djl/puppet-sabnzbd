# == Class: sabnzbd
#
# Install SABnzbd
#
# === Parameters
#
# [*user*]
#   The user SABnzbd should run as
#
# [*user_shell*]
#   The SABnzbd user's shell
#
# [*manage_user*]
#   Should Puppet manage the user resource
#
# [*data_dir*]
#   The directory containing data created by SABnzbd
#
# [*config_file*]
#   The path to the SABnzbd config file
#
# [*host*]
#   The address SABnzbd should listening on
#
# [*port*]
#   The port number SABnzbd should be running on
#
# [*extra_opts*]
#   Any extra options to be passed to the SABnzbd daemon
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
  $config_file = $sabnzbd::params::config_file,
  $host        = $sabnzbd::params::host,
  $port        = $sabnzbd::params::port,
  $extra_opts  = $sabnzbd::params::extra_opts,
) inherits sabnzbd::params {

  validate_bool($manage_user)

  class { 'sabnzbd::install': } ->
  class { 'sabnzbd::config': } ~>
  class { 'sabnzbd::service': } ->
  Class['sabnzbd']
}
