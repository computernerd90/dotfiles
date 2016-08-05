# Class: tmux
# ===========================
#
# Full description of class tmux here.
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
#    class { 'tmux':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class tmux {
    file { '/home/james/.tmux.conf':
        ensure => file,
        source => 'puppet:///modules/tmux/tmux.conf',
    }
    
    file { ['/home/james/.tmux/', '/home/james/.tmux/plugins/']:
        ensure => directory,
    }

    vcsrepo { '/home/james/.tmux/plugins/tpm':
        ensure => present,
        provider => git,
        source => 'https://github.com/tmux-plugins/tpm',
        require => File['/home/james/.tmux/plugins/'],
    }
}
