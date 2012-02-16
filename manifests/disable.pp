class postfix::disable {

  service{'postfix':
    ensure => stopped,
    enable => false,
  }
  package{'postfix':
    ensure => removed,
    require => Service['postfix'],
  }

}
