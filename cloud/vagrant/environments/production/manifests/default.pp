class { 'apt': }

apt::ppa{ 'ppa:ubuntu-elisp': }

package { 'emacs-snapshot':
  ensure  => 'latest',
  require => Apt::Ppa['ppa:ubuntu-elisp']
}

