# Class: servicereporter
# ===========================
#
# Full description of class servicereport here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
# 
# @example
#    class { 'servicereport':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Luc Raeskin <luc@raeskin.eu>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class servicenowreporter (
  String $servicenow_username = undef,
  String $servicenow_password = undef,
  String $servicenow_instance = undef,
  String $servicenow_webservice = '/api/now/import/u_service_puppet_changes',
  String $puppet_config_dir = '/etc/puppetlabs/puppet'
	) {

  package { 'faraday':
    ensure   => present,
    provider => puppet_gem,
  }


  file { "${puppet_config_dir}/servicenow.yaml":
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('servicenowreporter/servicenow.yaml.erb'),
  }
}
