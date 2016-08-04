# Class: vim
# ===========================
#
# Full description of class vim here.
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
#    class { 'vim':
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
class vim {
    file { '/home/james/.vimrc':
        ensure => file,
        source => 'puppet:///modules/vim/vimrc',
    }

    file { ['/home/james/.vim/', '/home/james/.vim/files/',
        '/home/james/.vim/colors/', '/home/james/.vim/files/backup/',
        '/home/james/.vim/files/swap/', '/home/james/.vim/files/undo/']:
        ensure => directory,
    }

    file { '/home/james/.vim/rc/plugins.vim':
        ensure => file,
        source => 'puppet:///modules/vim/plugins.vim',
    }

    file { '/home/james/.vim/rc/general.vim':
        ensure => file,
        source => 'puppet:///modules/vim/general.vim',
    }

    vcsrepo { '/home/james/.vim/bundle/Vundle.vim':
        ensure => present,
        provider => git,
        source => 'https://github.com/VundleVim/Vundle.vim.git',
    }
}
